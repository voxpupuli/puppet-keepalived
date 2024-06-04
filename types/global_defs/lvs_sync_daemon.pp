# @summary Defines parameters for lvs_sync_daemon as documented in `man 5 keepalived.conf`
type Keepalived::Global_defs::Lvs_sync_daemon = Struct[{
    interface        => String[1],
    vrrp_instance    => String[1],
    Optional[id]     => Integer[0, 255],
    Optional[maxlen] => Integer[1, 65507],
    Optional[port]   => Stdlib::Port,
    Optional[ttl]    => Integer[1, 255],
    Optional[group]  => Stdlib::IP::Address,
}]
