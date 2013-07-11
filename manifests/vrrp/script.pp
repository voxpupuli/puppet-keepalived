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
define keepalived::vrrp::script (
  $interval = '2',
  $script   = undef,
  $weight   = '2'
) {
  if ! $script {
    fail 'No script provided.'
  }

  concat::fragment { "keepalived.conf_vrrp_script_${name}":
    target  => "${keepalived::config_dir}/keepalived.conf",
    content => template('keepalived/vrrp_script.erb'),
    order   => 02,
  }
}

