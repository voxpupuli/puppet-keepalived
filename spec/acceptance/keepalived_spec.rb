require 'spec_helper_acceptance'

describe 'keepalived class' do
  context 'with default parameters' do
    pp = <<-EOS
    include keepalived

    notify { "Keepalived version was: ${facts['keepalived_version']}":
      require => Class['keepalived'],
    }
    EOS

    it 'works with no error' do
      apply_manifest(pp, catch_failures: true)
    end
    it 'works idempotently' do
      apply_manifest('include keepalived', catch_changes: true)
    end
    it 'creates fact keepalived_version' do
      service_fact = apply_manifest(pp, catch_failures: true)
      expect(service_fact.output).to match %r{.*Keepalived version was: (\d.\d.\d).*}
    end

    describe package('keepalived') do
      it { is_expected.to be_installed }
    end

    describe file('/etc/keepalived/keepalived.conf') do
      it { is_expected.to be_file }
    end
  end

  context 'on master with vrrp instance' do
    pp = <<-EOS
    include keepalived

    keepalived::vrrp::instance { 'VI_50':
      interface         => $facts['networking']['primary'],
      state             => 'MASTER',
      virtual_router_id => 50,
      priority          => 101,
      auth_type         => 'PASS',
      auth_pass         => 'secret',
      virtual_ipaddress => [ '10.0.0.1/16' ],
    }
    EOS

    it 'works with no error' do
      apply_manifest(pp, catch_failures: true)
    end
    it 'works idempotently' do
      apply_manifest(pp, catch_changes: true)
    end

    describe file('/etc/keepalived/keepalived.conf') do
      it { is_expected.to be_file }
      its(:content) { is_expected.to match %r{.*MASTER.*} }
    end

    describe service('keepalived') do
      it { is_expected.to be_running }
      it { is_expected.to be_enabled }
    end

    describe command('ip addr') do
      its(:stdout) { is_expected.to match %r{.*inet 10\.0\.0\.1/16 .*} }
    end
  end
end
