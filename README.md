# keepalived

[![License](https://img.shields.io/github/license/voxpupuli/puppet-keepalived.svg)](https://github.com/voxpupuli/puppet-keepalived/blob/master/LICENSE)
[![Build Status](https://travis-ci.org/voxpupuli/puppet-keepalived.png?branch=master)](https://travis-ci.org/voxpupuli/puppet-keepalived)
[![Puppet Forge](https://img.shields.io/puppetforge/v/puppet/keepalived.svg)](https://forge.puppetlabs.com/puppet/keepalived)
[![Puppet Forge - downloads](https://img.shields.io/puppetforge/dt/puppet/keepalived.svg)](https://forge.puppetlabs.com/puppet/keepalived)
[![Puppet Forge - endorsement](https://img.shields.io/puppetforge/e/puppet/keepalived.svg)](https://forge.puppetlabs.com/puppet/keepalived)
[![Puppet Forge - scores](https://img.shields.io/puppetforge/f/puppet/keepalived.svg)](https://forge.puppetlabs.com/puppet/keepalived)

#### Table of Contents

1. [Description](#description)
2. [Usage - Configuration options and additional functionality](#usage)
3. [Limitations - OS compatibility, etc.](#limitations)
4. [Development - Guide for contributing to the module](#development)

## Description

This puppet module manages [keepalived](http://www.keepalived.org/).
The main goal of keepalived is to provide simple and robust facilities for loadbalancing and high-availability to Linux system and Linux based infrastructures.

## Usage

### Basic IP-based VRRP failover

This configuration will fail-over when:

1. Master node is unavailable

```puppet
node /node01/ {
  include keepalived

  keepalived::vrrp::instance { 'VI_50':
    interface         => 'eth1',
    state             => 'MASTER',
    virtual_router_id => '50',
    priority          => '101',
    auth_type         => 'PASS',
    auth_pass         => 'secret',
    virtual_ipaddress => [ '10.0.0.1/29' ],
    track_interface   => ['eth1','tun0'], # optional, monitor these interfaces.
  }
}

node /node02/ {
  include keepalived

  keepalived::vrrp::instance { 'VI_50':
    interface         => 'eth1',
    state             => 'BACKUP',
    virtual_router_id => '50',
    priority          => '100',
    auth_type         => 'PASS',
    auth_pass         => 'secret',
    virtual_ipaddress => [ '10.0.0.1/29' ],
    track_interface   => ['eth1','tun0'], # optional, monitor these interfaces.
  }
}
```

or hiera:

```yaml
---
keepalived::vrrp_instance:
  VI_50:
    interface: 'eth1'
    state: 'MASTER'
    virtual_router_id: '50'
    priority: '101'
    auth_type: 'PASS'
    auth_pass: 'secret'
    virtual_ipaddress: '10.0.0.1/29'
    track_interface:
      - 'eth1'
      - 'tun0'
```

### Add floating routes

```puppet
node /node01/ {
  include keepalived

  keepalived::vrrp::instance { 'VI_50':
    interface         => 'eth1',
    state             => 'MASTER',
    virtual_router_id => '50',
    priority          => '101',
    auth_type         => 'PASS',
    auth_pass         => 'secret',
    virtual_ipaddress => [ '10.0.0.1/29' ],
    virtual_routes    => [ { to   => '168.168.2.0/24', via => '10.0.0.2' },
                           { to   => '168.168.3.0/24', via => '10.0.0.3' } ],
    virtual_rules     => [ { from => '168.168.2.42', lookup => 'customroute' } ]
  }
}
```

hiera:

```yaml
---
keepalived::vrrp_instance:
  VI_50:
    interface: 'eth1'
    state: 'MASTER'
    virtual_router_id: '50'
    priority: '101'
    auth_type: 'PASS'
    auth_pass: 'secret'
    virtual_ipaddress: '10.0.0.1/29'
    virtual_routes:
      - to: '168.168.2.0/24'
        via: '10.0.0.2'
      - to: 168.168.3.0/24'
        via: '10.0.0.3'
    virtual_rules:
      - from: '168.168.2.42'
        lookup: 'customroute'
```

### Detect application level failure

This configuration will fail-over when:

1. NGinX daemon is not running
1. Master node is unavailable

```puppet
node /node01/ {
  include ::keepalived

  keepalived::vrrp::script { 'check_nginx':
    script => '/usr/bin/killall -0 nginx',
  }

  keepalived::vrrp::instance { 'VI_50':
    interface         => 'eth1',
    state             => 'MASTER',
    virtual_router_id => '50',
    priority          => '101',
    auth_type         => 'PASS',
    auth_pass         => 'secret',
    virtual_ipaddress => '10.0.0.1/29',
    track_script      => 'check_nginx',
  }
}

node /node02/ {
  include ::keepalived

  keepalived::vrrp::script { 'check_nginx':
    script => '/usr/bin/killall -0 nginx',
  }

  keepalived::vrrp::instance { 'VI_50':
    interface         => 'eth1',
    state             => 'BACKUP',
    virtual_router_id => '50',
    priority          => '100',
    auth_type         => 'PASS',
    auth_pass         => 'secret',
    virtual_ipaddress => '10.0.0.1/29',
    track_script      => 'check_nginx',
  }
}
```

or hiera:

```yaml
---
keepalived::vrrp_script:
  check_nginx:
    script: '/usr/bin/killall -0 nginx'

keepalived::vrrp_instance:
  VI_50:
    interface: 'eth1'
    state: 'MASTER'
    virtual_router_id: '50'
    priority: '101'
    auth_type: 'PASS'
    auth_pass: 'secret'
    virtual_ipaddress: '10.0.0.1/29'
    track_script: check_nginx
```

or using process tracking (keepalived 2.0.11+):

```puppet
node /node01/ {
  include ::keepalived

  keepalived::vrrp::track_process { 'check_nginx':
    proc_name => 'nginx',
    weight    => 10,
    quorum    => 2,
    delay     => 10,
  }

  keepalived::vrrp::instance { 'VI_50':
    interface         => 'eth1',
    state             => 'MASTER',
    virtual_router_id => '50',
    priority          => '101',
    auth_type         => 'PASS',
    auth_pass         => 'secret',
    virtual_ipaddress => '10.0.0.1/29',
    track_process     => 'check_nginx',
  }
}
```

### IPv4 and IPv6 virtual IP, with application level failure detection

This configuration will fail-over both the IPv4 address and the IPv6 address when:

1. NGINX daemon is not running
1. Master node is unavailable

It is not possible to configure both IPv4 and IPv6 addresses as
virtual\_ipaddresses in a single vrrp\_instance; the reason is that the VRRP
protocol doesn't support it. The two VRRP instances can both use the same
virtual\_router\_id since VRRP IPv4 and IPv6 instances are completely
independent of each other. Both nodes have state set to BACKUP, which will
prevent them from entering MASTER state until the check script(s) have succeeded
and the election has been held.

To ensure that the IPv4 and IPv6 vrrp\_instances are always in the same state as
each other, configure a vrrp\_sync\_group to include both the instances. The
vrrp\_sync\_group require the global\_tracking flag to be enabled to prevent
keepalived from ignoring the tracking scripts for the vrrp\_sync\_group's
vrrp\_instance members.

Configure the vrrp\_instance with the native\_ipv6 flag to force the instance to
use IPv6. An IPv6 vrrp\_instance without the "native\_ipv6" keyword does not
configure the virtual IPv6 address with the "deprecated nodad" options.

RFC 3484, "Default Address Selection for Internet Protocol version 6 (IPv6)":
Configure a /128 mask for the IPv6 address for keepliaved to set
preferred\_lft to 0 to avoid the VI to be used for outgoing connections.

RFC5798 section 5.2.9 requires that if the protocol is IPv6, then the first
address must be the link local address of the virtual router.

IPv6 VRRP uses VRRP version 3, which does not support authentication, so the
auth\_type and auth\_pass parameters are removed for the IPv6 VRRP instance.

```puppet
node /node0x/ {
  keepalived::vrrp::script { 'check_nginx':
    script => '/usr/bin/pkill -0 nginx',
  }

  keepalived::vrrp::sync_group { 'VI_50':
    group               => [ 'VI_50_IPV4', 'VI_50_IPV6' ],
    global_tracking     => true,
    # or specify track-scripts instead
    # track_script      => [ 'notify.sh' ],
  }

  keepalived::vrrp::instance { 'VI_50_IPV4':
    interface           => 'eth0',
    state               => 'BACKUP',
    virtual_router_id   => 50,
    priority            => 100,
    auth_type           => 'PASS',
    auth_pass           => 'secret',
    virtual_ipaddress   => '10.0.0.1/32',
    track_script        => 'check_nginx',
  }

  keepalived::vrrp::instance { 'VI_50_IPV6':
    interface           => 'eth0',
    state               => 'BACKUP',
    virtual_router_id   => 50,
    priority            => 100,
    virtual_ipaddress   => ['fe80::50/128', '2001:db8::50/128', ],
    track_script        => 'check_nginx',
    native_ipv6         => true,
  }
}
```

### Global definitions

```puppet
class { 'keepalived::global_defs':
  notification_email      => 'no@spam.tld',
  notification_email_from => 'no@spam.tld',
  smtp_server             => 'localhost',
  smtp_connect_timeout    => '60',
  router_id               => 'your_router_instance_id',
}
```

### Soft-restart the Keepalived daemon

```puppet
class { '::keepalived':
  service_restart => 'service keepalived reload',     # When using SysV Init
  # service_restart => 'systemctl reload keepalived', # When using SystemD
}
```

### Opt out of having the service managed by the module

```puppet
class { '::keepalived':
  service_manage => false,
}
```

### Unicast instead of Multicast

**Caution: unicast support has only been added to Keepalived since version 1.2.8**

By default Keepalived will use multicast packets to determine failover conditions.
However, in many cloud environments it is not possible to use multicast because of
network restrictions.
Keepalived can be configured to use unicast in such environments:

Enable automatic unicast configuration with exported resources by setting
parameter 'collect\_unicast\_peers => true'

Automatic unicast configuration:

```puppet
  keepalived::vrrp::instance { 'VI_50':
    interface         => 'eth1',
    state             => 'BACKUP',
    virtual_router_id => '50',
    priority          => '100',
    auth_type         => 'PASS',
    auth_pass         => 'secret',
    virtual_ipaddress => '10.0.0.1/29',
    track_script      => 'check_nginx',
    collect_unicast_peers => true,
  }
```

Manual unicast configuration or override auto default IP:

```puppet
  keepalived::vrrp::instance { 'VI_50':
    interface         => 'eth1',
    state             => 'BACKUP',
    virtual_router_id => '50',
    priority          => '100',
    auth_type         => 'PASS',
    auth_pass         => 'secret',
    virtual_ipaddress => '10.0.0.1/29',
    track_script      => 'check_nginx',
    unicast_source_ip => $::ipaddress_eth1,
    unicast_peers     => ['10.0.0.1', '10.0.0.2']
  }
```

The 'unicast\_source\_ip' parameter is optional as Keepalived will bind to the
specified interface by default. This value will be exported in place of the default
when 'collect\_unicast\_peers => true'.
The 'unicast\_peers' parameter contains an array of ip addresses that correspond
to the failover nodes.

### Creating ip-based virtual server instances with two real servers

This sets up a virtual server www.example.com that directs traffic to
example1.example.com and example2.example.com by matching on an IP address
and port.

```puppet
keepalived::lvs::virtual_server { 'www.example.com':
  ip_address          => '1.2.3.4',
  port                => '80',
  delay_loop          => '7',
  lb_algo             => 'wlc',
  lb_kind             => 'DR',
  persistence_timeout => 86400,
  virtualhost         => 'www.example.com',
  protocol            => 'TCP'
}

keepalived::lvs::real_server { 'example1.example.com':
  virtual_server => 'www.example.com',
  ip_address     => '1.2.3.8',
  port           => '80',
  options        => {
    weight      => '1000',
    'TCP_CHECK' => {
       connection_timeout => '3',
    }
  }
}

keepalived::lvs::real_server { 'example2.example.com':
  virtual_server => 'www.example.com',
  ip_address     => '1.2.3.9',
  port           => '80',
  options        => {
    weight      => '1000',
    'TCP_CHECK' => {
       connection_timeout => '3',
    }
  }
}
```

or hiera:

```yaml
---
keepalived::lvs_virtual_server:
  www.example.com:
    ip_address: '1.2.3.4'
    port: 80
    delay_loop: 7
    lb_algo: 'wlc'
    lb_kind: 'DR'
    persistence_timeout: 86400
    virtualhost: 'www.example.com'
    protocol: 'TCP'

keepalived::lvs_real_server:
  example1.example.com:
    virtual_server: 'www.example.com'
    ip_address: '1.2.3.8'
    port: 80
    options:
      weight: '1000'
      TCP_CHECK:
        connect_timeout: 3
  example2.example.com:
    virtual_server: 'www.example.com'
    ip_address: '1.2.3.9'
    port: 80
    options:
      weight: '1000'
      TCP_CHECK:
        connect_timeout: 3
```

### Creating firewall mark based virtual server instances with two real servers

This sets up a virtual server www.example.com that directs traffic to
example1.example.com and example2.example.com by matching on a firewall mark
set in iptables or something similar.

```puppet
keepalived::lvs::virtual_server { 'www.example.com':
  fwmark              => '123',
  delay_loop          => '7',
  lb_algo             => 'wlc',
  lb_kind             => 'DR',
  persistence_timeout => 86400,
  virtualhost         => 'www.example.com',
  protocol            => 'TCP'
}

keepalived::lvs::real_server { 'example1.example.com':
  virtual_server => 'www.example.com',
  ip_address     => '1.2.3.8',
  port           => '80',
  options        => {
    weight      => '1000',
    'TCP_CHECK' => {
       connection_timeout => '3',
    }
  }
}

keepalived::lvs::real_server { 'example2.example.com':
  virtual_server => 'www.example.com',
  ip_address     => '1.2.3.9',
  port           => '80',
  options        => {
    weight      => '1000',
    'TCP_CHECK' => {
       connection_timeout => '3',
    }
  }
}
```

## Reference

Reference documentation [coming soon](https://github.com/voxpupuli/puppet-keepalived/issues/158).

## Limitations

Details in `metadata.json`.

## Development

The contributing guide is in [CONTRIBUTING.md](https://github.com/voxpupuli/puppet-keepalived/blob/master/.github/CONTRIBUTING.md).

## Release Notes/Contributors/Etc.

Details in `CHANGELOG.md`.

Migrated from https://github.com/arioch/puppet-keepalived to Vox Pupuli.
