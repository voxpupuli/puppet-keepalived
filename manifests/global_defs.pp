#
# @summary Manage keepalived notifictions
#
# @param notification_email Array of notification email Recipients.
#
# @param notification_email_from Define the notification email Sender.
#
# @param smtp_server Define the smtp server addres.
#
# @param smtp_connect_timeout Define the smtp connect timeout.
#
# @param router_id Define the router ID.
#
# @param script_user Set the global script_user option.
#
# @param enable_script_security Set the enable_script_security option.
#
# @param snmp_socket Define snmp master agent socker
#
# @param enable_snmp_keepalived Set enable_snmp_keepalived option.
#
# @param enable_snmp_vrrp Set enable_snmp_vrrp option.
#
# @param enable_snmp_checker Set enable_snmp_checker option
#
# @param enable_snmp_rfc Set enable_snmp_rfc option.
#
# @param enable_snmp_rfcv2 Set enable_snmp_rfcv2 option.
#
# @param enable_snmp_rfcv3 Set enable_snmp_rfcv3 option.
#
# @param enable_traps Set enable_traps option.
#
# @param enable_dbus Set enable_dbus option
#
# @param vrrp_higher_prio_send_advert Set vrrp_higher_prio_send_advert option.
#
# @param vrrp_min_garp Set vrrp_min_garp option.
#
# @param vrrp_garp_lower_prio_repeat Set vrrp_garp_lower_prio_repeat option.
#
# @param vrrp_garp_master_delay Set vrrp_garp_master_delay option
#
# @param vrrp_garp_master_refresh Set vrrp_garp_master_refresh option.
#
# @param vrrp_garp_master_repeat Set vrrp_garp_master_repeat option
#
# @param vrrp_garp_master_refresh_repeat Set vrrp_garp_master_refresh_repeat option
#
# @param vrrp_garp_lower_prio_delay Set vrrp_garp_lower_prio_delay option.
#
# @param vrrp_startup_delay Set vrrp_startup_delay option.
#
# @param bfd_rlimit_rttime Set bfd_rlimit_rttime option.
#
# @param checker_rlimit_rttime Set checker_rlimit_rttime option.
#
# @param vrrp_rlimit_rttime Set vrrp_rlimit_rttime option.
#
# @param bfd_priority Set bfd_priority option.
#
# @param checker_priority Set checker_priority option.
#
# @param vrrp_priority Set vrrp_priority option.
#
# @param bfd_rt_priority Set bfd_rt_priority option.
#
# @param checker_rt_priority Set checker_rt_priority option.
#
# @param vrrp_rt_priority Set vrrp_rt_priority option.
#
# @param bfd_no_swap Set bfd_no_swap option.
#
# @param checker_no_swap Set checker_no_swap option.
#
# @param vrrp_no_swap Set vrrp_no_swap option.
#
# @param vrrp_check_unicast_src Set vrrp_check_unicast_src option.
#
# @param vrrp_version Set vrrp_version option.
#
# @param max_auto_priority Set max_auto_priority option.
#
# @param dynamic_interfaces Set the dynamic_interfaces option.
#
# @param vrrp_notify_fifo Set the vrrp_notify_fifo option.
#
# @param vrrp_notify_fifo_script Set the vrrp_notify_fifo_script option.
#
# @param lvs_sync_daemon Set the lvs_sync_daemon option.
#
class keepalived::global_defs (
  $notification_email                                                 = undef,
  $notification_email_from                                            = undef,
  $smtp_server                                                        = undef,
  $smtp_connect_timeout                                               = undef,
  $router_id                                                          = undef,
  $script_user                                                        = undef,
  $enable_script_security                                             = undef,
  $enable_snmp_keepalived                                             = undef,
  $enable_snmp_vrrp                                                   = undef,
  $enable_snmp_checker                                                = undef,
  $enable_snmp_rfc                                                    = undef,
  $enable_snmp_rfcv2                                                  = undef,
  $enable_snmp_rfcv3                                                  = undef,
  $enable_traps                                                       = undef,
  Boolean $enable_dbus                                                = false,
  Optional[Boolean] $vrrp_higher_prio_send_advert                     = undef,
  Optional[Boolean] $vrrp_min_garp                                    = undef,
  Optional[Integer] $vrrp_garp_lower_prio_repeat                      = undef,
  Optional[Integer] $vrrp_garp_master_delay                           = undef,
  Optional[Integer] $vrrp_garp_master_refresh                         = undef,
  Optional[Integer] $vrrp_garp_master_repeat                          = undef,
  Optional[Integer] $vrrp_garp_master_refresh_repeat                  = undef,
  Optional[Integer] $vrrp_garp_lower_prio_delay                       = undef,
  Optional[Float] $vrrp_startup_delay                                 = undef,
  Optional[Integer] $bfd_rlimit_rttime                                = undef,
  Optional[Integer] $checker_rlimit_rttime                            = undef,
  Optional[Integer] $vrrp_rlimit_rttime                               = undef,
  Optional[Integer[-20, 19]] $bfd_priority                            = undef,
  Optional[Integer[-20, 19]] $checker_priority                        = undef,
  Optional[Integer[-20, 19]] $vrrp_priority                           = undef,
  Optional[Integer[1, 99]] $bfd_rt_priority                           = undef,
  Optional[Integer[1, 99]] $checker_rt_priority                       = undef,
  Optional[Integer[1, 99]] $vrrp_rt_priority                          = undef,
  Boolean $bfd_no_swap                                                = false,
  Boolean $checker_no_swap                                            = false,
  Boolean $vrrp_no_swap                                               = false,
  Boolean $vrrp_check_unicast_src                                     = false,
  Optional[Integer[2, 3]] $vrrp_version                               = undef,
  Optional[Integer[-1, 99]] $max_auto_priority                        = undef,
  Boolean $dynamic_interfaces                                         = false,
  Optional[Stdlib::Absolutepath] $vrrp_notify_fifo                    = undef,
  Optional[Stdlib::Absolutepath] $vrrp_notify_fifo_script             = undef,
  $snmp_socket                                                        = 'unix:/var/agentx/master',
  Optional[Keepalived::Global_defs::Lvs_sync_daemon] $lvs_sync_daemon = undef,
) {
  concat::fragment { 'keepalived.conf_globaldefs':
    target  => "${keepalived::config_dir}/keepalived.conf",
    content => template('keepalived/globaldefs.erb'),
    order   => '010',
  }
}
