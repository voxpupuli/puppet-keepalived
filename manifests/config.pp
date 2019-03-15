# == Class keepalived::config
#
class keepalived::config {
  File {
    ensure  => present,
    require => Class['::keepalived::install'],
    owner   => $::keepalived::config_owner,
    group   => $::keepalived::config_group,
  }

  if $::keepalived::service_manage == true {
    Concat {
      notify  => Service[$::keepalived::service_name],
    }
  }

  file { "/etc/${::keepalived::sysconf_dir}/keepalived":
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template("keepalived/keepalived.${::keepalived::sysconf_dir}.erb"),
  }

  file { $::keepalived::config_dir:
    ensure => directory,
    group  => $::keepalived::config_group,
    mode   => $::keepalived::config_dir_mode,
    owner  => $::keepalived::config_owner,
  }

  concat { "${::keepalived::config_dir}/keepalived.conf":
    owner => $::keepalived::config_owner,
    group => $::keepalived::config_group,
    mode  => $::keepalived::config_file_mode,
  }

  concat::fragment { 'keepalived.conf_header':
    target  => "${::keepalived::config_dir}/keepalived.conf",
    content => "# Managed by Puppet\n",
    order   => '001',
  }

  concat::fragment { 'keepalived.conf_footer':
    target  => "${::keepalived::config_dir}/keepalived.conf",
    content => "\n",
    order   => '999',
  }

  create_resources(keepalived::vrrp::instance, $::keepalived::vrrp_instance)
  create_resources(keepalived::vrrp::script, $::keepalived::vrrp_script)
  create_resources(keepalived::vrrp::vrrp_track_process, $::keepalived::vrrp_track_process)
  create_resources(keepalived::vrrp::sync_group, $::keepalived::vrrp_sync_group)
}

