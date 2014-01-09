# == Define: keepalived::vrrp::virtual_server
#
# Configure a Linux Virtual Server with keepalived
#
# Work in progress, supports:
#   - single IP/port virtual servers
#   - TCP_CHECK healthchecks
#
# === Parameters
#
# Refer to keepalived's documentation to understand the behaviour of these parameters
#
# [*ip_address*]
#   Virtual server IP address.
#
# [*port*]
#   Virtual sever IP port.
#
# [*lb_algo*]
#   Must be one of rr, wrr, lc, wlc, lblc, sh, dh
#   Default: not set.
#
# [*delay_loop*]
#   Default: not set.
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
#   Default: unset => no TCP_CHECK configured.
#
# [*sorry_server*]
#   The sorry_server to define
#   A hash with these keys:
#     [*ip_address*]
#     [*port*]
#
# [*real_servers*]
#   The real servers to balance to.
#   An array of hashes.
#   Hash keys:
#     [*ip_address*]
#     [*port*]       (if ommitted the port defaults to the VIP port)
#
define keepalived::lvs::virtual_server (
  $ip_address,
  $port,
  $lb_algo,
  $delay_loop=undef,
  $lb_kind='NAT',
  $ha_suspend=false,
  $persistence_timeout=undef,
  $virtualhost=undef,
  $alpha=false,
  $omega=false,
  $quorum=undef,
  $hysteresis=undef,
  $tcp_check=undef,
  $sorry_server=undef,
  $real_servers=undef
) {

  if ( ! is_ip_address($ip_address) ) {
    fail('Invalid IP address')
  }

  validate_re($port, '^[0-9]{1,5}$', "Invalid port: ${port}")
  validate_re($lb_algo, '^(rr|wrr|lc|wlc|lblc|sh|dh)$', "Invalid lb_algo: ${lb_algo}")
  if $delay_loop { validate_re($delay_loop, '^[0-9]+$', "Invalid delay_loop: ${delay_loop}") }
  validate_re($lb_kind, '^(NAT|DR|TUN)$', "Invalid lb_kind: ${lb_kind}")
  validate_bool($ha_suspend)
  validate_bool($alpha)
  validate_bool($omega)
  if $quorum { validate_re($quorum, '^[0-9]+$', "Invalid quorum: ${quorum}") }
  if $hysteresis { validate_re($hysteresis, '^[0-9]+$', "Invalid hysteresis ${hysteresis}") }

  if $sorry_server {
    if ( ! is_ip_address($sorry_server['ip_address']) ) {
      fail("Invalid sorry server IP address: ${sorry_server['ip_address']}")
    }
    validate_re($sorry_server['port'], '^[0-9]{1,5}$', "Invalid sorry serverport: ${sorry_server['port']}")
  }

  concat::fragment { "keepalived.conf_lvs_virtual_server_${name}":
    target  => "${keepalived::config_dir}/keepalived.conf",
    content => template('keepalived/lvs_virtual_server.erb'),
    order   => 250,
  }

}
