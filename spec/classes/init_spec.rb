# 2019-01-05 (cc) <paul4hough@gmail.com>
#
require 'spec_helper'

tobj = 'alertmanager_cloudera'

describe tobj, :type => :class do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end
      [tobj,
       'alertmanager_cloudera::install',
       'alertmanager_cloudera::config',
      ].each { |cls|
        it { is_expected.to contain_class(cls) }
      }
    end
  end
end
