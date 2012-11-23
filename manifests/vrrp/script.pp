# Define: keepalived::vrrp::script
#
define keepalived::vrrp::script (
  $ensure = present,
  $interval = '2',
  $script   = undef,
  $weight   = '2'
) {

  if $ensure == present {
    if ! $script {
      fail 'No script provided.'
    }

    concat::fragment { "keepalived.conf_vrrp_script_${name}":
      target  => "${keepalived::config_dir}/keepalived.conf.new",
      content => template('keepalived/vrrp_script.erb'),
      order   => 50,
    }
  }

}

