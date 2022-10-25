# frozen_string_literal: true

require 'spec_helper'

describe 'keepalived::vrrp::track_file', type: :define do
  let(:title) { '_FILE_NAME_' }
  let(:pre_condition) do
    'include keepalived'
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      describe 'without parameters', type: :define do
        it do
          expect { is_expected.to create_class('keepalived') }.to raise_error(Puppet::Error)
        end
      end

      describe 'with parameter proc_name' do
        let(:params) do
          {
            file_name: '_FILE_NAME_'
          }
        end

        it { is_expected.to create_keepalived__vrrp__track_file('_FILE_NAME_') }

        it do
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_track_file__FILE_NAME_').with(
              'order' => '015'
            )
        end
      end

      describe 'with parameter weight' do
        let(:params) do
          {
            weight: 110,
            file_name: '_FILE_NAME_'
          }
        end

        it { is_expected.to create_keepalived__vrrp__track_file('_FILE_NAME_') }

        it do
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_track_file__FILE_NAME_').with(
              'content' => %r{weight.*110}
            )
        end
      end

      describe 'with parameter init_file' do
        let(:params) do
          {
            init_file: '/etc/foo/bar',
            file_name: '_FILE_NAME_'
          }
        end

        it { is_expected.to create_keepalived__vrrp__track_file('_FILE_NAME_') }

        it do
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_track_file__FILE_NAME_').with(
              'content' => %r{init_file.*/etc/foo/bar}
            )
        end
      end

      describe 'with parameter overwrite' do
        let(:params) do
          {
            overwrite: true,
            init_file: '/etc/foo/bar',
            file_name: '_FILE_NAME_'
          }
        end

        it { is_expected.to create_keepalived__vrrp__track_file('_FILE_NAME_') }

        it {
          is_expected.to \
            contain_concat__fragment('keepalived.conf_vrrp_track_file__FILE_NAME_').with(
              'content' => %r{overwrite}
            )
        }
      end
    end
  end
end
