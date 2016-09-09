node 'cookbook', 'cookbook2', 'cookbook-test' {
	include puppet

	file { '/tmp/hello2':
		content	=> "Hello, world\n",
	}

}
