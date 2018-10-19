# == Class keepalived::global_defs
#
# === Parameters:
#
# $notification_email::       Array of notification email Recipients.
#                             Default: undef.
#
# $notification_email_from::  Define the notification email Sender.
#                             Default: undef.
#
# $smtp_server::              Define the smtp server addres.
#                             Default: undef.
#
# $smtp_connect_timeout::     Define the smtp connect timeout.
#                             Default: undef.
#
# $router_id::                Define the router ID.
#                             Default: undef.
#
# $script_user                Set the global script_user option.
#                             Default: undef.
#
# $enable_script_security::   Set the enable_script_security option.
#                             Default: undef.
#
# $snmp_socket::              Define snmp master agent socker
#                             Default: unix:/var/agentx/master
#
# $enable_snmp_keepalived::   Set enable_snmp_keepalived option.
#                             Default: undef.
#
# $enable_snmp_checker::      Set enable_snmp_keepalived option.
#                             Default: undef.
#
# $enable_snmp_rfc::          Set enable_snmp_keepalived option.
#                             Default: undef.
#
# $enable_snmp_rfcv2::        Set enable_snmp_keepalived option.
#                             Default: undef.
#
# $enable_snmp_rfcv3::        Set enable_snmp_keepalived option.
#                             Default: undef.
#
# $enable_traps::             Set enable_snmp_keepalived option.
#                             Default: undef.
#
class keepalived::global_defs(
  $notification_email      = undef,
  $notification_email_from = undef,
  $smtp_server             = undef,
  $smtp_connect_timeout    = undef,
  $router_id               = undef,
  $script_user             = undef,
  $enable_script_security  = undef,
  $enable_snmp_keepalived  = undef,
  $enable_snmp_checker     = undef,
  $enable_snmp_rfc         = undef,
  $enable_snmp_rfcv2       = undef,
  $enable_snmp_rfcv3       = undef,
  $enable_traps            = undef,
  $snmp_socket             = 'unix:/var/agentx/master',
) inherits keepalived::params {
  concat::fragment { 'keepalived.conf_globaldefs':
    target  => "${::keepalived::params::config_dir}/keepalived.conf",
    content => template('keepalived/globaldefs.erb'),
    order   => '010',
  }
}
