## puppet-alertmanager_cloudera

[![Test Build Status](https://travis-ci.org/pahoughton/puppet-alertmanager_cloudera.png)](https://travis-ci.org/pahoughton/puppet-alertmanager_cloudera)

Install and configure
[alertmanager-cloudera](https://github.com/pahoughton/alertmanager-cloudera)
to send cloudera script alerts to
prometheus [alertmanager](https://prometheus.io/docs/alerting/alertmanager/).

## usage

```puppet
class { 'alertmanager_cloudera':
  config_file	=> '/etc/alertmanager-cloudera.yml',
  bin_dir		=> '/usr/local/bin'
}
```

creates $bin_dir/cloudera-alert script for use as the alert script in
cloudera.

## limitations

* centos / rhel 7

## contribute

https://github.com/pahoughton/puppet-alertmanager-cloudera

## licenses

2019-02-26 (cc) <paul4hough@gmail.com>

GNU General Public License v3.0

See [COPYING](../master/COPYING) for full text.
