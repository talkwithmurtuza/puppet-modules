class ntp::file {
	
        $template = $ntp::params::template
      	$servers  = $ntp::params::defaults_servers
	file { '/etc/ntp.conf':
		ensure  => file,
		require => Package['ntp'],
		content => template("ntp/${template}.erb"),
 	}
}
