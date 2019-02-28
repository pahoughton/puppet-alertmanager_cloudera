# 2019-01-05 (cc) <paul4hough@gmail.com>
#
require 'spec_helper'

tobj = 'alertmanager_cloudera'

def_cfg  = '/etc/alertmanager-cloudera.yml'

param_cfg       = '/etc/cloudera-alert/config.yml'


describe tobj, :type => :class do
  describe "#{tobj}::config" do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end
        context "with defaults" do
          it { is_expected.to contain_file( def_cfg ) }
        end
        context "config_file=#{param_cfg}" do
          let (:params) {
            { 'config_file'.to_sym => param_cfg }
          }
          it { is_expected.to contain_file( param_cfg ) }
        end
      end
    end
  end
end
