# Define Keepalived::Lvs::Real_server
#
# @summary keepalived::lvs::real_server
#   Add a real server to a Linux Virtual Server with keepalived
#
# @param virtual_server
#   The name of the virtual server this real server will be added to
#
# @param ip_address
#   The ip address of the real server
#
# @param port
#   Real sever IP port.  (if ommitted the port defaults to the VIP port)
#
# @param options
#   One or more options to include in the real_server block
#
#   @example
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
  String[1] $virtual_server,
  Stdlib::IP::Address $ip_address,
  Stdlib::Port $port,
  Keepalived::Options $options = {},
) {
  $_name = regsubst($name, '[:\/\n]', '')

  concat::fragment { "keepalived.conf_lvs_real_server_${_name}":
    target  => "${keepalived::config_dir}/keepalived.conf",
    content => template('keepalived/lvs_real_server.erb'),
    order   => "250-${virtual_server}-${_name}",
  }
}
