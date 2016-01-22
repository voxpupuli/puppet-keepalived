# == Define: keepalived::lvs::real_server
#
# Add a real server to a Linux Virtual Server with keepalived
#
# === Parameters
#
# Refer to keepalived's documentation to understand the behaviour
# of these parameters
#
# [*virtual_server*]
#   The name of the virtual server this real server will be added to
#
# [*ip_address*]
#   The ip address of the real server
#
# [*port*]
#   Real sever IP port.  (if ommitted the port defaults to the VIP port)
#
# [*options*]
#   One or more options to include in the real_server block
#
#   Example:
#     options => {
#       inhibit_on_failure => true,
#       SMTP_CHECK => {
#         connect_timeout => 10
#         host => {
#           connect_ip => '127.0.0.1'
#         }
#       }
#     }
#
define keepalived::lvs::real_server (
  $virtual_server,
  $ip_address,
  $port,
  $options = {},
) {
  $_name = regsubst($name, '[:\/\n]', '')

  if ( ! is_ip_address($ip_address) ) {
    fail('Invalid IP address')
  }

  validate_re($port, '^[0-9]{1,5}$', "Invalid port: ${port}")

  concat::fragment { "keepalived.conf_lvs_real_server_${_name}":
    target  => "${::keepalived::config_dir}/keepalived.conf",
    content => template('keepalived/lvs_real_server.erb'),
    order   => "250-${virtual_server}-${_name}-000",
  }

  concat::fragment { "keepalived.conf_lvs_real_server_${_name}-footer":
    target  => "${::keepalived::config_dir}/keepalived.conf",
    content => "  }\n",
    order   => "250-${virtual_server}-${_name}-zzz",
  }

}
