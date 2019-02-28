# 2019-01-07 (cc) <paul4hough@gmail.com>
#
require 'spec_helper'

tobj = 'alertmanager_cloudera'

def_exec        = '/usr/local/bin/alertmanager-cloudera'
def_script      = '/usr/local/bin/cloudera-alert'

param_bin_dir   = '/usr/tools/bin'
param_exec      = "#{param_bin_dir}/alertmanager-cloudera"
param_script    = "#{param_bin_dir}/cloudera-alert"


describe tobj, :type => :class do
  describe "#{tobj}::install" do
    context "with defaults" do
      it { is_expected.to contain_file(def_exec) }
      it { is_expected.to contain_file(def_script).with('mode' => '0555') }
    end
    context "with bin_dir = #{param_bin_dir}" do
      let (:params) {{ 'bin_dir'.to_sym => param_bin_dir }}
      it { is_expected.to contain_file(param_exec) }
      it { is_expected.to contain_file(param_script).with('mode' => '0555') }
    end
  end
end
