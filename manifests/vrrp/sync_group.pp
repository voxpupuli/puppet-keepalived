# == Define: keepalived::vrrp::sync_group
#
# === Parameters:
#
# $group::                 Define vrrp instances to group (Array)
#                          Default: undef.
#
# $track_interface::       Synchronization group tracking interface will
#                          update the status/priority of all VRRP instances
#                          which are members of the sync group.
#                          Default: undef.
#
# $track_script::          Add a tracking script to the sync group
#                          (<SCRIPT_NAME> is the name of the vrrp_script entry)
#                          Default: undef.
#
# $track_file::            Files whose state we monitor, value is added to
#                          effective priority.
#                          Default: undef.
#
# $track_process::         Process to monitor
#                          Default: undef.
#
# $track_bfd::             BFD instances we monitor
#                          Default: undef.
#
# $notify_script_master::  Define the notify master script.
#                          Depricated: Use $notify_master
#                          Default: undef.
#
# $notify_master::         Define the notify master script.
#                          Default: undef.
#
# $notify_script_backup::  Define the notify backup script.
#                          Depricated: Use $notify_backup
#                          Default: undef.
#
# $notify_backup::         Define the notify backup script.
#                          Default: undef.
#
# $notify_script_fault::   Define the notify fault script.
#                          Depricated: Use $notify_fault
#                          Default: undef.
#
# $notify_fault::          Define the notify fault script.
#                          Default: undef.
#
# $notify_stop::           Executed when stopping vrrp
#                          Default: undef.
#
# $notify_deleted::        Causes DELETED to be sent to notifies rather than the
#                          default FAULT after a vrrp instance is deleted during
#                          a reload. If a script is specified, that script will
#                          be executed as well.
#                          Default: undef.
#
# $notify_script::         Define the notify script.
#                          Depricated: Use $notify
#                          Default: undef.
#
# $notify::                Define the notify script.
#                          Depricated: Use $notify
#                          Default: undef.
#
# $notify_priority_changes:: Send FIFO notifies for vrrp priority changes
#                          Default: undef.
#
# $smtp_alert::            Send email notification during state transition
#                          Default: undef.
#
# $global_tracking::       DEPRECATED. Use track_interface, track_script and
#                          track_file on vrrp_sync_groups instead.
#                          Default: undef.
#
# $sync_group_tracking_weight:: Allow sync groups to use differing weights.
#                          This probably WON'T WORK, but is a replacement for
#                          global_tracking in case different weights were used
#                          across different vrrp instances in the same sync group.
#                          Default: undef.
#
define keepalived::vrrp::sync_group (
#  Variant[String, Array[String], Undef] $group                      = undef,
  $group,
  Variant[String, Array[String], Undef] $track_interface            = undef,
  Variant[String, Array[String], Undef] $track_script               = undef,
  Variant[String, Array[String], Undef] $track_file                 = undef,
  Variant[String, Array[String], Undef] $track_process              = undef,
  Variant[String, Array[String], Undef] $track_bfd                  = undef,
  Optional[String] $notify_script_master                            = undef,
  Optional[String] $notify_script_backup                            = undef,
  Optional[String] $notify_script_fault                             = undef,
  Optional[String] $notify_script_stop                              = undef,
  Variant[Boolean, String, Undef] $notify_script_deleted            = undef,
  Optional[String] $notify_script                                   = undef,
  Optional[Boolean] $notify_priority_changes                        = undef,
  Optional[Boolean] $smtp_alert                                     = undef,
  Optional[Boolean] $global_tracking                                = undef,
  Optional[Boolean] $sync_group_tracking_weight                     = undef,
) {
  $_name = regsubst($name, '[:\/\n]', '')

  concat::fragment { "keepalived.conf_vrrp_sync_group_${_name}":
    target  => "${keepalived::config_dir}/keepalived.conf",
    content => template('keepalived/vrrp_sync_group.erb'),
    order   => '050',
  }
}
