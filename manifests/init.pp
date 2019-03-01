# 2019-01-05 (cc) <paul4hough@gmail.com>
#
class alertmanager_cloudera (
  String $version,
  Stdlib::Absolutepath $config_dir,
  Stdlib::Absolutepath $config_file,
  String $config_mode,
  Optional[String] $download_url,
  Variant[Stdlib::HTTPUrl, Stdlib::HTTPSUrl] $download_url_base,
  String $download_extension,
  Hash $config,
  Stdlib::Absolutepath $bin_dir,
) {

  $real_download_url = pick(
    $download_url,
    "${download_url_base}/v${version}/alertmanager-cloudera-${version}.amd64.${download_extension}")

  contain alertmanager_cloudera::install
  contain alertmanager_cloudera::config

  Class['alertmanager_cloudera::install']
  -> Class['alertmanager_cloudera::config']

}
