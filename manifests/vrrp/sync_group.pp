# @summary keepalived::vrrp::sync_group
#
# @param group
#   Define vrrp instances to group (Array)
#
# @param notify_script_master
#   Define the notify master script.
#
# @param notify_script_backup
#   Define the notify backup script.
#
# @param notify_script_fault
#   Define the notify fault script.
#
# @param notify_script
#   Define the notify script.
#
# @param notify_script_master_rx_lower_pri
#   Define the notify_master_rx_lower_pri script.
#   This is executed if a master receives an advert with
#   priority lower than the master's advert.
#
# @param smtp_alert
#   Send email on status change (Boolean)
#
define keepalived::vrrp::sync_group (
  $group,
  Optional[Stdlib::Absolutepath] $notify_script_master_rx_lower_pri = undef,
  $notify_script_master                                             = undef,
  $notify_script_backup                                             = undef,
  $notify_script_fault                                              = undef,
  $notify_script                                                    = undef,
  $smtp_alert                                                       = undef,
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

