# == Define: keepalived::lvs::virtual_server_group
#
# Configure a Linux Virtual Server Group with keepalived
#
# === Parameters
#
# Refer to keepalived's documentation to understand the behaviour of these parameters
#
# [*lvs*]
# Hash, of arrays, of hashs, to describe the virtual server group
# lvs = { "name" => "myFirstGroup",
# 	"real_servers" => [
# 		{ "ip_address" => "10.32.13.33",
# 			"weight" => "100",
# 			"inhibit_on_failure" => true,
# 			"port" => "17",
# 		 },
# 		{ "ip_address" => "10.32.13.34", "weight" => "100", "inhibit_on_failure" => true },
# 	],
# 	"virtual_servers" => [ 
# 		{ "ip_address" => "172.12.82.2", "port" => "82" },
# 		{ "ip_address" => "172.12.82.3", "port" => "83" },
# 		{ "ip_address" => "172.12.82.4" }
# 	]
# }
# 
# "port" can be overridden per real_server and per virtual_server
#
# [*port*]
#   Virtual server IP port.
#
# [*lb_algo*]
#   Must be one of rr, wrr, lc, wlc, lblc, sh, dh
#   Default: not set.
#
# [*delay_loop*]
#   Default: not set.
#
# [*protocol*]
#   Default: TCP
#
# [*lb_kind*]
#   Must be one of NAT, TUN, DR.
#   Default: NAT
#
# [*ha_suspend*]
#   Boolean.
#   Default: false => not set in config.
#
# [*alpha*]
#   Boolean.
#   Default: false => not set in config.
#
# [*omega*]
#   Boolean.
#   Default: false => not set in config.
#
# [*quorum*]
#   Integer.
#   Defaults to unset => does not appear in config.
#
# [*hysteresis*]
#   Integer.
#   Defaults to unset => does not appear in config.
#
# [*tcp_check*]
#   The TCP_CHECK to configure for real_servers.
#   Should be a hash containing these keys:
#     [*connect_timeout*]
#   And may contain these keys:
#     [*connect_ip*]
#     [*bindto*]
#     [*bind_port*]
#     [*fwmark*]
#     [*warmup*]
#   Default: unset => no TCP_CHECK configured.
#
# [*misc_check*]
#   The MISC_CHECK to configure for real_servers.
#   Should be a hash containing these keys:
#     [*misc_path*]
#     [*connect_timeout*]
#   And may contain these keys:
#     [*warmup*]
#     [*misc_dynamic*]
#   Default: unset => no MISC_CHECK configured.
#
# [*http_get*]
#   The HTTP_GET to configure for real_servers.
#   Should be a hash containing these keys:
#     [*path*]
#     [*digest*]
#     [*connect_timeout*]
#   And may contain these keys:
#     [*nb_get_retry*]
#     [*delay_before_retry*]
#     [*connect_ip*]
#     [*connect_port*]
#     [*bindto*]
#     [*bind_port*]
#     [*fwmark*]
#     [*warmup*]
#   Default: unset => no HTTP_GET configured.
#
# [*ssl_get*]
#   The SSL_GET to configure for real_servers.
#   Should be a hash containing these keys:
#     [*path*]
#     [*digest*]
#     [*connect_timeout*]
#   And may contain these keys:
#     [*nb_get_retry*]
#     [*delay_before_retry*]
#     [*connect_ip*]
#     [*connect_port*]
#     [*bindto*]
#     [*bind_port*]
#     [*fwmark*]
#     [*warmup*]
#   Default: unset => no SSL_GET configured.
#
# [*sorry_server*]
#   The sorry_server to define
#   A hash with these keys:
#     [*ip_address*]
#     [*port*]
#
define keepalived::lvs::virtual_server_group (
  $lvs,
  $port,
  $lb_algo,
  $alpha               = false,
  $delay_loop          = undef,
  $ha_suspend          = false,
  $http_get            = undef,
  $hysteresis          = undef,
  $lb_kind             = 'NAT',
  $misc_check          = undef,
  $omega               = false,
  $persistence_timeout = undef,
  $protocol            = 'TCP',
  $quorum              = undef,
  $sorry_server        = undef,
  $ssl_get             = undef,
  $tcp_check           = undef,
  $virtualhost         = undef,
) {
  $_name = regsubst($name, '[:\/\n]', '')

  validate_re($port, '^[0-9]{1,5}$', "Invalid port: ${port}")
  validate_re(
    $lb_algo, '^(rr|wrr|lc|wlc|lblc|sh|dh|sed)$',
    "Invalid lb_algo: ${lb_algo}"
  )

  if $delay_loop {
    validate_re(
      $delay_loop,
      '^[0-9]+$',
      "Invalid delay_loop: ${delay_loop}"
    )
  }

  validate_re($lb_kind, '^(NAT|DR|TUN)$', "Invalid lb_kind: ${lb_kind}")
  validate_re($protocol, '^(TCP|UDP)$', "Invalid protocol: ${protocol}")
  validate_bool($ha_suspend)
  validate_bool($alpha)
  validate_bool($omega)

  if $quorum { validate_re($quorum, '^[0-9]+$', "Invalid quorum: ${quorum}") }

  if $hysteresis {
    validate_re(
      $hysteresis,
      '^[0-9]+$',
      "Invalid hysteresis ${hysteresis}"
    )
  }

  if $sorry_server {
    if ( ! is_ip_address($sorry_server['ip_address']) ) {
      fail("Invalid sorry server IP address: ${sorry_server['ip_address']}")
    }

    validate_re(
      $sorry_server['port'],
      '^[0-9]{1,5}$',
      "Invalid sorry serverport: ${sorry_server['port']}"
    )
  }

  concat::fragment { "keepalived.conf_lvs_virtual_server_group_${_name}":
    target  => "${::keepalived::config_dir}/keepalived.conf",
    content => template('keepalived/lvs_virtual_server_group.erb'),
    order   => "250-${_name}-000",
  }

  concat::fragment { "keepalived.conf_lvs_virtual_server_group_${_name}-footer":
    target  => "${::keepalived::config_dir}/keepalived.conf",
    content => "}\n\n",
    order   => "250-${_name}-zzz",
  }
}
