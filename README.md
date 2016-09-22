# Puppet Keepalived

## Build status

[![Build Status](https://travis-ci.org/arioch/puppet-keepalived.png?branch=master)](https://travis-ci.org/arioch/puppet-keepalived)

## Requirements

* [concat module](https://github.com/ripienaar/puppet-concat)

## Tested on...

* Debian 7 (Wheezy)
* Debian 6 (Squeeze)
* RHEL 6

## Example usage

### Basic IP-based VRRP failover

This configuration will fail-over when:

a. Master node is unavailable

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
    virtual_routes    => [ { to  => '168.168.2.0/24', via => '10.0.0.2' },
                           { to  => '168.168.3.0/24', via => '10.0.0.3' } ]
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
```

### Detect application level failure

This configuration will fail-over when:

a. NGinX daemon is not running<br>
b. Master node is unavailable

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

### Global definitions

```puppet
class { 'keepalived::global_defs':
  ensure                  => present,
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

**caution: unicast support has only been added to Keepalived since version 1.2.8**

By default Keepalived will use multicast packets to determine failover conditions.
However, in many cloud environments it is not possible to use multicast because of
network restrictions. Keepalived can be configured to use unicast in such environments:

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
The 'unicast\_source\_ip' parameter is optional as Keepalived will bind to the specified interface by default.
The 'unicast\_peers' parameter contains an array of ip addresses that correspond to the failover nodes.

## Unit testing

Plain RSpec:

    $ rake spec

Using bundle:

    $ bundle exec rake spec

Test against a specific Puppet or Facter version:

    $ PUPPET_VERSION=3.2.1  bundle update && bundle exec rake spec
    $ PUPPET_VERSION=2.7.19 bundle update && bundle exec rake spec
    $ FACTER_VERSION=1.6.8  bundle update && bundle exec rake spec

## Contributing

* Fork it
* Create a feature branch (`git checkout -b my-new-feature`)
* Run rspec tests (`bundle exec rake spec`)
* Commit your changes (`git commit -am 'Added some feature'`)
* Push to the branch (`git push origin my-new-feature`)
* Create new Pull Request
