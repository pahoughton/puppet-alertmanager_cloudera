# 2019-01-05 (cc) <paul4hough@gmail.com>
#
class alertmanager_cloudera::install {

  assert_private()

  if $alertmanager_cloudera::download_extension == '' {
    file { "/opt/alertmanager-cloudera-${alertmanager_cloudera::version}":
      ensure => directory,
      mode   => '0775',
    }
    -> archive { "/opt/alertmanager-cloudera-${alertmanager_cloudera::version}/alertmanager-cloudera":
      ensure          => present,
      source          => $alertmanager_cloudera::real_download_url,
      checksum_verify => false,
      before          => File["/opt/alertmanager-cloudera-${alertmanager_cloudera::version}/alertmanager-cloudera"],
    }
  } else {
    archive { "/tmp/alertmanager-cloudera-${alertmanager_cloudera::version}.${alertmanager_cloudera::download_extension}":
      ensure          => present,
      extract         => true,
      extract_path    => '/opt',
      source          => $alertmanager_cloudera::real_download_url,
      checksum_verify => false,
      creates         => "/opt/alertmanager-cloudera-${alertmanager_cloudera::version}.amd64/alertmanager-cloudera",
      cleanup         => true,
      before          => File["/opt/alertmanager-cloudera-${alertmanager_cloudera::version}.amd64/alertmanager-cloudera"],
    }
  }
  file { "/opt/alertmanager-cloudera-${alertmanager_cloudera::version}.amd64/alertmanager-cloudera":
    mode  => '0555',
  }
  -> file { "${alertmanager_cloudera::bin_dir}/alertmanager-cloudera":
    ensure => link,
    target => "/opt/alertmanager-cloudera-${alertmanager_cloudera::version}.amd64/alertmanager-cloudera",
  }

  file { "${alertmanager_cloudera::bin_dir}/cloudera-alert":
    ensure  => present,
    mode    => '0555',
    content => template('alertmanager_cloudera/cloudera-alert.erb'),
  }

}
