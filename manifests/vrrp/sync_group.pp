# == Define: keepalived::vrrp::sync_group
#
# === Parameters:
#
# $group::                 Define vrrp instances to group (Array)
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
# $notify_script_master_rx_lower_pri   Define the notify_master_rx_lower_pri script.
#                          This is executed if a master receives an advert with
#                          priority lower than the master's advert.
#                          Default: undef.
#
# $smtp_alert::            Send email on status change (Boolean)
#                          Default: undef.
#
# $track_script::          Define which script to run to track service states.
#                          Default: undef.
#
define keepalived::vrrp::sync_group (
  $group,
  Optional[Stdlib::Absolutepath] $notify_script_master_rx_lower_pri = undef,
  $notify_script_master                                             = undef,
  $notify_script_backup                                             = undef,
  $notify_script_fault                                              = undef,
  $notify_script                                                    = undef,
  $smtp_alert                                                       = undef,
  $track_script                                                     = undef,
  $nopreempt                                                        = undef,
  Boolean $global_tracking                                          = false,
) {
  $_name = regsubst($name, '[:\/\n]', '')

  concat::fragment { "keepalived.conf_vrrp_sync_group_${_name}":
    target  => "${keepalived::config_dir}/keepalived.conf",
    content => template('keepalived/vrrp_sync_group.erb'),
    order   => '050',
  }
}
