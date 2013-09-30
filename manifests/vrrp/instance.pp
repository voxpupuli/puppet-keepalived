# == Define: keepalived::vrrp::instance
#
# === Parameters:
#
# $interface::             Define which interface to listen on.
#
# $priority::              Set instance priority.
#
# $state::                 Set instance state.
#                          Valid options: MASTER, BACKUP.
#
# $virtual_ipaddress_int:: Set interface for VIP to be assigned to, defaults to $interfac
#
# $virtual_ipaddress::     Set floating IP address.
#
#                          May be specified as either:
#                          a) ip address (or array of IP addresses) e.g. `'10.0.0.1'`
#                          b) a hash (or array of hashes) containing extra properties
#                             e.g. `{ 'ip' => '10.0.0.1', 'label' => 'webvip' }`
#                             Supported properties: dev, brd, label, scope.
#                          
# $virtual_router_id::     Set virtual router id.
#
# $ensure::                Default: present.
#
# $auth_type::             Set authentication method.
#                          Default: undef.
#
# $auth_pass::             Authentication password.
#                          Default: undef.
#
# $track_script::          Define which script to run to track service states.
#                          Default: undef.
#
# $lvs_interface::         Define lvs_sync_daemon_interface.
#                          Default: undef.
#
define keepalived::vrrp::instance (
  $interface,
  $priority,
  $state,
  $virtual_ipaddress,
  $virtual_router_id,
  $ensure                = present,
  $auth_type             = undef,
  $auth_pass             = undef,
  $track_script          = undef,
  $lvs_interface         = undef,
  $virtual_ipaddress_int = undef,
) {
  concat::fragment { "keepalived.conf_vrrp_instance_${name}":
    ensure  => $ensure,
    target  => "${keepalived::config_dir}/keepalived.conf",
    content => template('keepalived/vrrp_instance.erb'),
    order   => 100,
  }
}

