# @summary
#   Configure keepalived module
#
class keepalived::config {
  File {
    ensure  => present,
    require => Class['keepalived::install'],
    owner   => $keepalived::config_owner,
    group   => $keepalived::config_group,
  }

  if $keepalived::service_manage == true {
    Concat {
      notify  => Service[$keepalived::service_name],
    }
  }

  file { "/etc/${keepalived::sysconf_dir}/keepalived":
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template("keepalived/keepalived.${keepalived::sysconf_dir}.erb"),
  }

  file { $keepalived::config_dir:
    ensure => directory,
    group  => $keepalived::config_group,
    mode   => $keepalived::config_dir_mode,
    owner  => $keepalived::config_owner,
  }

  concat { "${keepalived::config_dir}/keepalived.conf":
    owner => $keepalived::config_owner,
    group => $keepalived::config_group,
    mode  => $keepalived::config_file_mode,
  }

  concat::fragment { 'keepalived.conf_header':
    target  => "${keepalived::config_dir}/keepalived.conf",
    content => "# Managed by Puppet\n",
    order   => '001',
  }

  concat::fragment { 'keepalived.conf_footer':
    target  => "${keepalived::config_dir}/keepalived.conf",
    content => "\n",
    order   => '999',
  }

  $keepalived::vrrp_instance.each |String $key, Hash $attrs| {
    keepalived::vrrp::instance { $key:
      * => $attrs,
    }
  }
  $keepalived::vrrp_script.each |String $key, Hash $attrs| {
    keepalived::vrrp::script { $key:
      * => $attrs,
    }
  }
  $keepalived::vrrp_track_process.each |String $key, Hash $attrs| {
    keepalived::vrrp::track_process { $key:
      * => $attrs,
    }
  }
  $keepalived::vrrp_sync_group.each |String $key, Hash $attrs| {
    keepalived::vrrp::sync_group { $key:
      * => $attrs,
    }
  }
  $keepalived::lvs_real_server.each |String $key, Hash $attrs| {
    keepalived::lvs::real_server { $key:
      * => $attrs,
    }
  }
  $keepalived::lvs_virtual_server.each |String $key, Hash $attrs| {
    keepalived::lvs::virtual_server { $key:
      * => $attrs,
    }
  }
}
