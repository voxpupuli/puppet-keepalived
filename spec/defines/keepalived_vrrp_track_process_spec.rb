require 'spec_helper'

describe 'keepalived::vrrp::track_process', type: :define do
  let(:facts) { debian_facts }
  let(:pre_condition) { '$concat_basedir = "/tmp"' }

  describe 'without parameters', type: :define do
    let(:facts) { debian_facts }
    let(:title) { '_PROC_NAME_' }

    it do
      expect { is_expected.to create_class('keepalived') }.to raise_error(Puppet::Error)
    end
  end

  describe 'with parameter proc_name' do
    let(:title) { '_PROC_NAME_' }
    let(:params) do
      {
        proc_name: '_PROC_NAME_'
      }
    end

    it { is_expected.to create_keepalived__vrrp__track_process('_PROC_NAME_') }
    it do
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_track_process__PROC_NAME_').with(
          'content' => %r{process.*_PROC_NAME_}
        )
    end
  end

  describe 'with parameter weight' do
    let(:title) { '_PROC_NAME_' }
    let(:params) do
      {
        weight: '_VALUE_',
        proc_name: '_PROC_NAME_'
      }
    end

    it { is_expected.to create_keepalived__vrrp__track_process('_PROC_NAME_') }
    it do
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_track_process__PROC_NAME_').with(
          'content' => %r{weight.*_VALUE_}
        )
    end
  end

  describe 'with parameter quorum' do
    let(:title) { '_PROC_NAME_' }
    let(:params) do
      {
        quorum:    '_VALUE_',
        proc_name: '_PROC_NAME_'
      }
    end

    it { is_expected.to create_keepalived__vrrp__track_process('_PROC_NAME_') }
    it do
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_track_process__PROC_NAME_').with(
          'content' => %r{quorum.*_VALUE_}
        )
    end
  end

  describe 'with parameter delay' do
    let(:title) { '_PROC_NAME_' }
    let(:params) do
      {
        delay:     '_VALUE_',
        proc_name: '_PROC_NAME_'
      }
    end

    it { is_expected.to create_keepalived__vrrp__track_process('_PROC_NAME_') }
    it {
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_track_process__PROC_NAME_').with(
          'content' => %r{delay.*_VALUE_}
        )
    }
  end

  describe 'with parameter fullcommand' do
    let(:title) { '_PROC_NAME_' }
    let(:params) do
      {
        fullcommand: '_VALUE_',
        proc_name:   '_PROC_NAME_'
      }
    end

    it { is_expected.to create_keepalived__vrrp__track_process('_PROC_NAME_') }
    it do
      is_expected.to \
        contain_concat__fragment('keepalived.conf_vrrp_track_process__PROC_NAME_').with(
          'content' => %r{fullcommand$}
        )
    end
  end
end
