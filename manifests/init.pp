# Install and configure ngrok.
class ngrok(
  String $url,
  String $install_path = '/opt',
  Optional[Hash] $archive_arguments = {}
) {  # lint:ignore:parameter_defaults
  validate_absolute_path($install_path)

  $binary_path = "${install_path}/ngrok"

  archive { '/tmp/ngrok.zip':
    ensure       => 'present',
    extract      => true,
    extract_path => $install_path,
    source       => $url,
    creates      => $binary_path,
    cleanup      => true,
    *            => $archive_arguments;
  } ->
  file { $install_path:
    owner => root,
    group => root,
    mode  => '0755',
  }

  file { '/usr/local/bin/ngrok':
    ensure => link,
    target => '/opt/ngrok',
  }
}
