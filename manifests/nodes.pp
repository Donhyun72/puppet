node 'cookbook', 'cookbook2', 'cookbook-test' {
  include puppet
  include memcached

  file { '/tmp/hello2':
    content  => "Hello, world\n",
  }

}
