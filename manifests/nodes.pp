
#node 'cookbook', 'cookbook2' {
#	file { '/tmp/hello':
#		content	=> "Hello, workd\n",
#	}
#}

node 'cookbook' {
	include puppet
}
