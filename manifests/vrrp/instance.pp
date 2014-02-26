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
# $virtual_ipaddress_int:: Set interface for VIP to be assigned to, defaults to $interface
#
# $virtual_ipaddress::     Set floating IP address.
#
#                          May be specified as either:
#                          a) ip address (or array of IP addresses) e.g. `'10.0.0.1'`
#                          b) a hash (or array of hashes) containing extra properties
#                             e.g. `{ 'ip' => '10.0.0.1', 'label' => 'webvip' }`
#                             Supported properties: dev, brd, label, scope.
#
# $virtual_ipaddress_excluded:: For cases with large numbers (eg 200) of IPs
#                               on the same interface. To decrease the number
#                               of packets sent in adverts, you can exclude
#                               most IPs from adverts.
#                               Default: undef.
#
#                               May be specified as either:
#                               a) ip address (or array of IP addresses) e.g. `'10.0.0.1'`
#                               b) a hash (or array of hashes) containing extra properties
#                               e.g. `{ 'ip' => '10.0.0.1', 'scope' => 'local' }`
#                               Supported properties: dev, brd, label, scope.
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
# $track_interface::       Define which interface(s) to monitor. Go to FAULT state if one of
#                          these interfaces goes down.
#                          May be specified as either:
#                            a) interface name
#                            b) array of interfaces names
#                          Default: undef.
#
# $lvs_interface::         Define lvs_sync_daemon_interface.
#                          Default: undef.
#
# $notify_script::         Script to run during ANY state transit
#                          Default: undef.
#
# $smtp_alert::            Send status alerts via SMTP. Requires user provided
#                          in SMTP settings in keepalived::global_defs class.
#                          Default: false.
# $nopreempt::             allows the lower priority # machine to maintain the master role, 
#                          even when # a higher priority machine comes back online. # 
#                          NOTE: For this to work, the initial state of this # entry must be BACKUP
# $notify_script_master::  Define the notify master script.
#                          Default: undef.
#
# $notify_script_backup::  Define the notify backup script.
#                          Default: undef.
#
# $notify_script_fault::   Define the notify fault script.
#                          Default: undef.
#
# $notify_script::         Define the notify script.
#                          Default: undef.

define keepalived::vrrp::instance (
  $interface,
  $priority,
  $state,
  $virtual_ipaddress,
  $virtual_router_id,
  $ensure                     = present,
  $auth_type                  = undef,
  $auth_pass                  = undef,
  $track_script               = undef,
  $track_interface            = undef,
  $lvs_interface              = undef,
  $virtual_ipaddress_int      = undef,
  $virtual_ipaddress_excluded = undef,
  $notify_script              = undef,
  $smtp_alert                 = false,
  $nopreempt                  = false,
  $notify_script_master       = undef,
  $notify_script_backup       = undef,
  $notify_script_fault        = undef,
  $notify_script              = undef,

) {
  concat::fragment { "keepalived.conf_vrrp_instance_${name}":
    ensure  => $ensure,
    target  => "${keepalived::config_dir}/keepalived.conf",
    content => template('keepalived/vrrp_instance.erb'),
    order   => 100,
  }
}

