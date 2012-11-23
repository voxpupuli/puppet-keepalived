# Define: keepalived::vrrp::instance
#
define keepalived::vrrp::instance (
  $auth_pass,
  $interface,
  $priority,
  $state,
  $virtual_ipaddress,
  $virtual_router_id,
  $ensure       = present,
  $auth_type    = 'PASS',
  $track_script = undef,
) {

  if $ensure == present {
    concat::fragment { "keepalived.conf_vrrp_instance_${name}":
      target  => "${keepalived::config_dir}/keepalived.conf",
      content => template('keepalived/vrrp_instance.erb'),
      order   => 100,
    }
  }

}

