# Define: keepalived::vrrp::script
#
define keepalived::vrrp::script (
  $ensure = present,
  $interval = '2',
  $script   = undef,
  $weight   = '2'
) {

  if ! $script {
    fail 'No script provided.'
  }

  concat::fragment { "keepalived.conf_vrrp_script_${name}":
    ensure  => $ensure,
    target  => "${keepalived::config_dir}/keepalived.conf",
    content => template('keepalived/vrrp_script.erb'),
    order   => 02,
  }

}

