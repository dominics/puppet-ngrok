# Pass home dir as namevar to create a ngrok configuration
define ngrok::config(
  Optional[String] $token = ''
) {  # lint:ignore:parameter_defaults
  validate_absolute_path($name)

  ensure_resource(file, "${name}/.config", { ensure => 'directory' })

  file { "${name}/.config/ngrok":
    ensure  => 'directory',
    require => File["${name}/.config"],
  } ->
  file { "${name}/.config/ngrok/config.yml":
    ensure  => present,
    content => template('ngrok/config.erb'),
    mode    => '0644',
  }

  # ngrok does not support XDG. ngrok should support XDG.
  file { "${name}/.ngrok2": ensure => 'directory' } ->
  file { "${name}/.ngrok2/ngrok.yml":
    ensure => link,
    target => "${name}/.config/ngrok/config.yml",
  }
}
