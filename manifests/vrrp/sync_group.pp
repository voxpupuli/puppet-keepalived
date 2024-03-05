#
# @summary Configure the group for instance
#
# @param group Define vrrp instances to group (Array)
#
# @param notify_script_master Define the notify master script.
#
# @param track_script Define which script to run to track service states.
#
# @param track_process Define which process check to run to track processes.
#
# @param notify_script_backup Define the notify backup script.
#
# @param notify_script_fault Define the notify fault script.
#
# @param notify_script Define the notify script.
#
# @param notify_script_master_rx_lower_pri
#   Define the notify_master_rx_lower_pri script.
#   This is executed if a master receives an advert with
#   priority lower than the master's advert.
#
# @param smtp_alert Send email on status change
#
# @param nopreempt
#
# @param global_tracking
#
# @param track_interface
#   Define which interface(s) to monitor.
#   Go to FAULT state if one of
#   these interfaces goes down.
#   May be specified as either:
#     a) interface name
#     b) array of interfaces names
#
define keepalived::vrrp::sync_group (
  $group,
  Optional[Stdlib::Absolutepath] $notify_script_master_rx_lower_pri = undef,
  Array[String] $track_script                                       = [],
  Array[String] $track_process                                      = [],
  $notify_script_master                                             = undef,
  $notify_script_backup                                             = undef,
  $notify_script_fault                                              = undef,
  $notify_script                                                    = undef,
  $smtp_alert                                                       = undef,
  $nopreempt                                                        = undef,
  Boolean $global_tracking                                          = false,
  Optional[Variant[String, Array[String]]] $track_interface         = undef,
) {
  $_name = regsubst($name, '[:\/\n]', '', 'G')

  concat::fragment { "keepalived.conf_vrrp_sync_group_${_name}":
    target  => "${keepalived::config_dir}/keepalived.conf",
    content => template('keepalived/vrrp_sync_group.erb'),
    order   => '050',
  }
}
