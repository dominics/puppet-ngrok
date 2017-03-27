# puppet-ngrok

An opinionated Puppet Module to install and manage [Ngrok](https://ngrok.com/).

puppet-ngrok is available on the [Puppet Forge](https://forge.puppetlabs.com/thekevjames/ngrok).

## Usage

To install ngrok, include the main `ngrok` class:

```puppet
include '::ngrok'
```

### Configuration

If you'd like to configure one or more user's ngrok tokens, you can use the `ngrok::config` define:

```puppet
ngrok::config { '/home/someuser':
  token => 'some-secret-token';
}
```

The name of the resource should be the path to a user's home directory.

## Parameters

You can also provide values for the following parameters:

```yaml
ngrok::url: https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip # An absolute URL for where to download the ngrok zip file
ngrok::install_path: /opt # The install path to use; ngrok will be installed to <path>/ngrok, as well as symlinked into /usr/local/bin
ngrok::archive_arguments: {} # An optional hash of arguments that will passed to the archive {} resource, e.g. checksum (see https://forge.puppet.com/puppet/archive#usage)
```
