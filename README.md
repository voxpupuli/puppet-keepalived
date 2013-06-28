# Puppet Keepalived

## Build status

[![Build Status](https://travis-ci.org/arioch/puppet-keepalived.png?branch=master)](https://travis-ci.org/arioch/puppet-keepalived)

## Requirements

* [concat module](https://github.com/ripienaar/puppet-concat)

## Tested on...

* Debian 6 (Squeeze)
* RHEL 6

## Example usage

### Basic IP-based VRRP failover

This configuration will fail-over when:

a. Master node is unavailable

    node /node01/ {
      include keepalived

      keepalived::vrrp::instance { 'VI_50':
        interface         => 'eth1',
        state             => 'MASTER',
        virtual_router_id => '50',
        priority          => '101',
        auth_type         => 'PASS',
        auth_pass         => 'secret',
        virtual_ipaddress => '10.0.0.1/29',
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
        virtual_ipaddress => '10.0.0.1/29',
      }
    }

### Detect application level failure

This configuration will fail-over when:

a. NGinX daemon is not running<br>
b. Master node is unavailable

    node /node01/ {
      include keepalived

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
      include keepalived

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

## Unit testing

Plain RSpec:

    $ rake spec

Using bundle:

    $ bundle exec rake spec

Test against a specific Puppet or Facter version:

    $ PUPPET_VERSION=3.2.1  bundle update && bundle exec rake spec
    $ PUPPET_VERSION=2.7.19 bundle update && bundle exec rake spec
    $ FACTER_VERSION=1.6.8  bundle update && bundle exec rake spec

