# == Class keepalived
#
class keepalived (
  String[1] $sysconf_dir     = $keepalived::params::sysconf_dir,
  String    $sysconf_options = $keepalived::params::sysconf_options,

  Stdlib::Absolutepath $config_dir       = $keepalived::params::config_dir,
  Stdlib::Filemode     $config_dir_mode  = $keepalived::params::config_dir_mode,
  Stdlib::Filemode     $config_file_mode = $keepalived::params::config_file_mode,

  String[1] $config_group = $keepalived::params::config_group,
  String[1] $config_owner = $keepalived::params::config_owner,
  String[1] $daemon_group = $keepalived::params::daemon_group,
  String[1] $daemon_user  = $keepalived::params::daemon_user,

  String[1]        $pkg_ensure = $keepalived::params::pkg_ensure,
  Array[String[1]] $pkg_list   = $keepalived::params::pkg_list,

  Boolean                 $service_enable     = $keepalived::params::service_enable,
  Stdlib::Ensure::Service $service_ensure     = $keepalived::params::service_ensure,
  Boolean                 $service_hasrestart = $keepalived::params::service_hasrestart,
  Boolean                 $service_hasstatus  = $keepalived::params::service_hasstatus,
  Boolean                 $service_manage     = $keepalived::params::service_manage,
  String[1]               $service_name       = $keepalived::params::service_name,
  Optional[String[1]]     $service_restart    = $keepalived::params::service_restart,

  Hash $vrrp_instance      = {},
  Hash $vrrp_script        = {},
  Hash $vrrp_track_process = {},
  Hash $vrrp_sync_group    = {},
) inherits keepalived::params {

  class { 'keepalived::install': }
  -> class { 'keepalived::config': }
  -> class { 'keepalived::service': }
}
