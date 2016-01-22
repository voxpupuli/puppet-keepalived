# == Define: keepalived::lvs::real_server::misc_check
#
# Add a misc check to a specific real_server
#
# === Parameters
#
# Refer to keepalived's documentation to understand the behaviour
# of these parameters
#
# [*virtual_server*]
#   The name of the virtual server the real server belongs to
#
# [*real_server*]
#   The name of the real server this check will be added to
#
# [*misc_path*]
#   The path to the executable of the misc check
#
# [*misc_timeout*]
#   The timeout of the misc check
#
# [*misc_dynamic*]
#   Wheter or not the returnc code of the misc check is interpreded as weight

define keepalived::lvs::real_server::misc_check (
  $virtual_server,
  $real_server,
  $misc_path,
  $misc_timeout = 0,
  $misc_dynamic = false,
) {
  $_real_server = regsubst($real_server, '[:\/\n]', '')
  $_name = regsubst($name, '[:\/\n]', '')

  concat::fragment { "keepalived.conf_lvs_real_server_misc_check_${_name}":
    target  => "${::keepalived::config_dir}/keepalived.conf",
    content => template('keepalived/lvs_real_server_misc_check.erb'),
    order   => "250-${virtual_server}-${_real_server}-${_name}",
  }
}
