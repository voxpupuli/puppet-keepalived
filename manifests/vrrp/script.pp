# == Define: keepalived::vrrp::script
#
# === Parameters:
#
# $ensure::   Default: present
#
# $interval:: Set the interval to run the vrrp script.
#             Default: '2'
#
# $script::   Which command or script to execute.
#             Default: undef
#
# $weight::   The weight the script should add to the instance.
#             Default: '2'
#
# $fall::     required number of failures for KO switch.
#             Default: undef
#
# $rise::     required number of successes for OK switch.
#             Default: undef
#
# $timeout::  max time to wait for the vrrp script to return.
#             Default: undef
#
# $user::     user to run the vrrp script under.
#             Default: undef
#
# $group::    group to run the vrrp script under - only used if $user is also set.
#             Default: undef
#
define keepalived::vrrp::script (
  String[1] $script,
  $interval  = '2',
  $weight    = undef,
  $fall      = undef,
  $rise      = undef,
  $timeout   = undef,
  $user      = undef,
  $group     = undef,
  $no_weight = false,
) {
  $_name = regsubst($name, '[:\/\n]', '')

  if ! $weight {
    $weight_real = 2
  } else {
    if $no_weight {
      fail('Cannot enable no_weight and specify a weight!')
    } else {
      $weight_real = $weight
    }
  }

  concat::fragment { "keepalived.conf_vrrp_script_${_name}":
    target  => "${keepalived::config_dir}/keepalived.conf",
    content => template('keepalived/vrrp_script.erb'),
    order   => '002',
  }
}

