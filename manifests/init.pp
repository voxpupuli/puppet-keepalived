# @summary
#   Install and configure keepalived
#
# @param sysconf_dir
#
# @param sysconf_options
#
# @param config_dir
#
# @param config_dir_mode
#
# @param config_file_mode
#
# @param config_validate_cmd Input for the `validate_cmd` param of the keepalived.conf concat fragment.
#
# @param validate_config Boolean to enable/disable the config validation
#
# @param config_group
#
# @param config_owner
#
# @param daemon_group
#
# @param daemon_user
#
# @param pkg_ensure
#
# @param pkg_list
#
# @param service_enable
#
# @param service_ensure
#
# @param service_hasrestart
#
# @param service_hasstatus
#
# @param service_manage
#
# @param service_name
#
# @param service_restart
#
# @param global_defs
#
# @param vrrp_instance
#
# @param vrrp_script
#
# @param vrrp_track_process
#
# @param vrrp_sync_group
#
# @param lvs_real_server
#
# @param lvs_virtual_server
#
# @param include_external_conf_files
#
# @param manage_package
#
class keepalived (
  String[1] $sysconf_dir,
  String    $sysconf_options,
  Optional[Boolean] $service_hasrestart = undef,
  Optional[Boolean] $service_hasstatus = undef,

  Stdlib::Absolutepath   $config_dir          = '/etc/keepalived',
  Stdlib::Filemode       $config_dir_mode     = '0755',
  Stdlib::Filemode       $config_file_mode    = '0644',
  Stdlib::Absolutepath   $config_validate_cmd = '/usr/sbin/keepalived -l -t -f %',
  Boolean                $validate_config     = true,

  Array[Stdlib::Absolutepath] $include_external_conf_files = [],

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

  Boolean                 $manage_package     = true,

  Optional[Hash] $global_defs = undef,
  Hash $vrrp_instance         = {},
  Hash $vrrp_script           = {},
  Hash $vrrp_track_process    = {},
  Hash $vrrp_sync_group       = {},
  Hash $lvs_real_server       = {},
  Hash $lvs_virtual_server    = {},
) {
  contain keepalived::install
  contain keepalived::config
  contain keepalived::service

  Class['keepalived::install']
  -> Class['keepalived::config']
  -> Class['keepalived::service']
}
