#
# @summary Configure the process tracker
#
# @param proc_name 
#   process name to track
#   use an Array configuration to specify process parameters (first element needs to
#   be the process name).
#
# @param weight The weight that should add to the instance.
#
# @param quorum Number of processes to expect running
#
# @param delay this sets fork_delay and terminate_delay (for keepalived => 2.0.16), before terminate_delay
#
# @param fork_delay time to delay after process quorum gained after fork before consider process up
#
# @param terminate_delay time to delay after process quorum lost before consider process down
#
# @param full_command Match entire process cmdline
#
# @param param_match  Set inital if command has no parameters or use partial if first n parameters match
#
define keepalived::vrrp::track_process (
  Variant[String[1], Array[String[1],1]] $proc_name,
  Optional[Integer[0]] $weight   = undef,
  Integer[0] $quorum             = 1,
  Optional[Integer[0]] $delay    = undef,
  Optional[Integer[0]] $fork_delay = undef,
  Optional[Integer[0]] $terminate_delay = undef,
  Boolean $full_command          = false,
  Optional[Enum['initial','partial']] $param_match = undef
) {
  concat::fragment { "keepalived.conf_vrrp_track_process_${name}":
    target  => "${keepalived::config_dir}/keepalived.conf",
    content => epp('keepalived/vrrp_track_process.epp', {
        'name'            => $name,
        'proc_name'       => $proc_name,
        'weight'          => $weight,
        'quorum'          => $quorum,
        'delay'           => $delay,
        'fork_delay'      => $fork_delay,
        'terminate_delay' => $terminate_delay,
        'full_command'    => $full_command,
        'param_match'     => $param_match
    }),
    order   => '020',
  }
}
