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
define keepalived::vrrp::script (
  $interval  = '2',
  $script    = undef,
  $weight    = undef,
  $fall      = undef,
  $rise      = undef,
  $timeout   = undef,
  $no_weight = false,
) {
  $_name = regsubst($name, '[:\/\n]', '')

  if ! $script {
    fail 'No script provided.'
  }

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
    target  => "${::keepalived::config_dir}/keepalived.conf",
    content => template('keepalived/vrrp_script.erb'),
    order   => '002',
  }
}

