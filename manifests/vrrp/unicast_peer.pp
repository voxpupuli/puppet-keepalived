# == Define: keepalived::vrrp::unicast_peer
#
# === Parameters:
#
# $instance::   Name of vrrp instance this peer belongs to
#
# $ip_address:: IP address of unicast peer
#               Default: $name
#
define keepalived::vrrp::unicast_peer (
  String $instance,
  Stdlib::IP::Address $ip_address = $name,
) {
  assert_private()

  $_inst = regsubst($instance, '[:\/\n]', '')

  concat::fragment { "keepalived.conf_vrrp_instance_${_inst}_upeers_peer_${ip_address}":
    target  => "${keepalived::config_dir}/keepalived.conf",
    content => "    ${ip_address}\n",
    order   => "100-${_inst}-020",
  }
}
