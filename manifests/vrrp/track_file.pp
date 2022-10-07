#
# @summary Configure the tracker file
#
# @param file_name  name of track file
#
# @param weight The weight that should add to the instance.
#
# @param init_file create the file and/or initialise the value
#
# @param overwrite  This causes VALUE (default 0) to be written to
# the specified file at startup if the file doesn't
# exist, unless overwrite is specified in which case
# any existing file contents will be overwritten with
# the specified value.
#
define keepalived::vrrp::track_file (
  String[1] $file_name,
  Integer $weight                 = 1,
  Optional[String[1]] $init_file  = undef,
  Boolean $overwrite              = false,
) {
  concat::fragment { "keepalived.conf_vrrp_track_file_${file_name}":
    target  => "${keepalived::config_dir}/keepalived.conf",
    content => epp('keepalived/vrrp_track_file.epp', {
        'name'      => $name,
        'file_name' => $file_name,
        'weight'    => $weight,
        'init_file' => $init_file,
        'overwrite' => $overwrite,
    }),
    order   => '015',
  }
}
