# @summary
#   Class keepalived::global_defs
#
# @param notification_email
#   Array of notification email Recipients.
#
# @param notification_email_from
#   Define the notification email Sender.
#
# @param smtp_server
#   Define the smtp server addres.
#
# @param smtp_connect_timeout
#   Define the smtp connect timeout.
#
# @param router_id
#   Define the router ID.
#
# @param script_user
#   Set the global script_user option.
#
# @param enable_script_security
#   Set the enable_script_security option.
#
# @param snmp_socket
#   Define snmp master agent socker
#
# @param enable_snmp_keepalived
#   Set enable_snmp_keepalived option.
#
# @param enable_snmp_checker
#   Set enable_snmp_keepalived option.
#
# @param enable_snmp_rfc
#   Set enable_snmp_keepalived option.
#
# @param enable_snmp_rfcv2
#   Set enable_snmp_keepalived option.
#
# @param enable_snmp_rfcv3
#   Set enable_snmp_keepalived option.
#
# @param enable_traps
#   Set enable_snmp_keepalived option.
#
# @param vrrp_higher_prio_send_advert
#   Set vrrp_higher_prio_send_advert option.
#
# @param vrrp_garp_lower_prio_repeat
#   Set vrrp_garp_lower_prio_repeat option.
#
# $vrrp_garp_master_refresh::     Set vrrp_garp_master_refresh option.
#                                  Default: undef.
#
# $vrrp_garp_lower_prio_delay::   Set vrrp_garp_lower_prio_delay option.
#                                  Default: undef.
#
class keepalived::global_defs(
  $notification_email                             = undef,
  $notification_email_from                        = undef,
  $smtp_server                                    = undef,
  $smtp_connect_timeout                           = undef,
  $router_id                                      = undef,
  $script_user                                    = undef,
  $enable_script_security                         = undef,
  $enable_snmp_keepalived                         = undef,
  $enable_snmp_checker                            = undef,
  $enable_snmp_rfc                                = undef,
  $enable_snmp_rfcv2                              = undef,
  $enable_snmp_rfcv3                              = undef,
  $enable_traps                                   = undef,
  Optional[Boolean] $vrrp_higher_prio_send_advert = undef,
  Optional[Integer] $vrrp_garp_lower_prio_repeat  = undef,
  Optional[Integer] $vrrp_garp_master_refresh     = undef,
  Optional[Integer] $vrrp_garp_lower_prio_delay   = undef,
  $snmp_socket                                    = 'unix:/var/agentx/master',
) {
  concat::fragment { 'keepalived.conf_globaldefs':
    target  => "${keepalived::config_dir}/keepalived.conf",
    content => template('keepalived/globaldefs.erb'),
    order   => '010',
  }
}
