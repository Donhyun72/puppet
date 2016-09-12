
# This is a test.
class puppet {
  file { '/usr/local/bin/papply':
    source  => 'puppet:///modules/puppet/papply.sh',
    mode    => '0755',
  }

  file { '/usr/local/bin/pull-updates':
    source  => 'puppet:///modules/puppet/pull-updates.sh',
    mode    => '0755',
  }

  file { '/root/.ssh/id_rsa':
    source  => 'puppet:///modules/puppet/ubuntu.priv',
    owner   => 'root',
    mode    => '0600',
    require => File['/root/.ssh'],
  }

  file { '/root/.ssh':
    ensure  => directory,
    owner   => 'root',
    mode    => '0700',
  }

  cron { 'run-puppet':
    ensure  => present,
    user    => 'root',
    command => '/usr/local/bin/pull-updates',
    minute  => '*/10',
    hour    => '*',
  }
}
