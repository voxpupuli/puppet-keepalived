# == Class keepalived
#
class keepalived (
  String[1] $sysconf_dir,
  String    $sysconf_options,
  Boolean   $service_hasrestart,
  Boolean   $service_hasstatus,

  Stdlib::Absolutepath $config_dir       = '/etc/keepalived',
  Stdlib::Filemode     $config_dir_mode  = '0755',
  Stdlib::Filemode     $config_file_mode = '0644',

  String[1] $config_group = 'root',
  String[1] $config_owner = 'root',
  String[1] $daemon_group = 'root',
  String[1] $daemon_user  = 'root',

  String[1]        $pkg_ensure = 'present',
  Array[String[1]] $pkg_list   = ['keepalived'],

  Boolean                 $service_enable     = true,
  Stdlib::Ensure::Service $service_ensure     = 'running',
  Boolean                 $service_manage     = true,
  String[1]               $service_name       = 'keepalived',
  Optional[String[1]]     $service_restart    = undef,

  Hash $vrrp_instance      = {},
  Hash $vrrp_script        = {},
  Hash $vrrp_track_process = {},
  Hash $vrrp_sync_group    = {},
  Hash $lvs_real_server    = {},
  Hash $lvs_virtual_server = {},
) {
  contain keepalived::install
  contain keepalived::config
  contain keepalived::service

  Class['keepalived::install']
  -> Class['keepalived::config']
  -> Class['keepalived::service']
}
