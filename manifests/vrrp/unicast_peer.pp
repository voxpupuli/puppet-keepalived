# @summary
#   Define a unicast peer for a vrrp instance.
#
# @api private
#
# @example Define a known, static unicast peer
#   keepalived::vrrp::unicast_peer { '10.1.2.3':
#     instance => 'my_vrrp_instance_name',
#   }
#
# @example Export ourselves as a unicast peer for other peers to import
#   @@keepalived::vrrp::unicast_peer { $facts['networking']['ip']:
#     instance => 'my_vrrp_instance_name',
#   }
#
# @param instance
#   Name of vrrp instance this peer belongs to.
# @param ip_address
#   IP address of unicast peer. Defaults to $name.
#
define keepalived::vrrp::unicast_peer (
  String $instance,
  Stdlib::IP::Address $ip_address = $name,
) {
  assert_private()

  $_inst = regsubst($instance, '[:\/\n]', '', 'G')
  $_ordersafe = regsubst($_inst, '-', '', 'G')

  concat::fragment { "keepalived.conf_vrrp_instance_${_inst}_upeers_peer_${ip_address}":
    target  => "${keepalived::config_dir}/keepalived.conf",
    content => "    ${ip_address}\n",
    order   => "100-${_ordersafe}-020",
  }
}
