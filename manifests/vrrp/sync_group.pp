# == Define: keepalived::vrrp::sync_group
#
# === Parameters:
#
# $group::                 Define vrrp instances to group (Array)
#
# $ensure::                Default: present.
#
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
#
# $smtp_alert::            Send email on status change (Boolean)
#                          Default: undef.
#
#
define keepalived::vrrp::sync_group (
  $group,
  $ensure               = present,
  $notify_script_master = undef,
  $notify_script_backup = undef,
  $notify_script_fault  = undef,
  $notify_script        = undef,
  $smtp_alert           = undef,
  $nopreempt            = undef,
) {
  concat::fragment { "keepalived.conf_vrrp_sync_group_${name}":
    ensure  => $ensure,
    target  => "${::keepalived::config_dir}/keepalived.conf",
    content => template('keepalived/vrrp_sync_group.erb'),
    order   => '050',
  }
}

