# 2019-01-05 (cc) <paul4hough@gmail.com>
#
class alertmanager_cloudera::config {

  assert_private()

  ensure_resource('file',$alertmanager_cloudera::config_dir,
    {
      ensure => 'directory',
      mode   => '0775'
    }
  )

  file { $alertmanager_cloudera::config_file:
    ensure  => present,
    mode    => $alertmanager_cloudera::config_mode,
    content => template('alertmanager_cloudera/alertmanager-cloudera.yml.erb'),
  }

}
