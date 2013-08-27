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
# $ensure::                   Default: present.
#
#
class keepalived::global_defs(
  $notification_email      = undef,
  $notification_email_from = undef,
  $smtp_server             = undef,
  $smtp_connect_timeout    = undef,
  $router_id               = undef,
  $ensure                  = present,
){
  if $notification_email {
    if is_array($notification_email) {
      $notification_email_array = $notification_email
    }
    else {
      $notification_email_array = [$notification_email]
    }
  }
  concat::fragment { 'keepalived.conf_globaldefs':
    ensure  => $ensure,
    target  => "${keepalived::config_dir}/keepalived.conf",
    content => template('keepalived/globaldefs.erb'),
    order   => 010,
  }
}
