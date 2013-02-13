# Define: keepalived::vrrp::instance
#
define keepalived::vrrp::instance (
  $auth_pass,
  $interface,
  $priority,
  $state,
  $virtual_ipaddress,
  $virtual_router_id,
  $ensure        = present,
  $auth_type     = undef,
  $auth_pass     = undef,
  $track_script  = undef,
  $lvs_interface = undef,
) {

  concat::fragment { "keepalived.conf_vrrp_instance_${name}":
    ensure  => $ensure,
    target  => "${keepalived::config_dir}/keepalived.conf",
    content => template('keepalived/vrrp_instance.erb'),
    order   => 100,
  }

}

