
node 'cookbook' {
	file { '/tmp/hello':
		content	=> "Hello, workd\n",
	}
}

