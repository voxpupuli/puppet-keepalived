require 'spec_helper_acceptance'

describe 'keepalived class' do

  context 'default parameters' do
    it 'should work with no errors' do
      pp = <<-EOS
      include keepalived

      keepalived::vrrp::instance { 'VI_50':
        interface         => 'eth1',
        state             => 'MASTER',
        virtual_router_id => '50',
        priority          => '101',
        auth_type         => 'PASS',
        auth_pass         => 'secret',
        virtual_ipaddress => [ '10.0.0.1/29' ],
      }
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes  => true)
    end

    describe package('keepalived') do
      it { should be_installed }
    end

    describe file('/etc/keepalived/keepalived.conf') do
      it { should be_file }
    end

    describe service('keepalived') do
      it { should be_running }
      it { should be_enabled }
    end
  end
end
