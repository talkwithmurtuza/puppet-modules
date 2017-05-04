class base {
	$dnsutils = $osfamily ? {
		'RedHat' => 'bind-utils',
		'Debian' => 'dnsutils', }
	
	$systemupdate = $osfamily ? {
			'RedHat' => '/usr/bin/yum update -y',
			'Debian' => '/usr/bin/apt-get upgrade -y',
		}
	package { ['tree',$dnsutils]:
		ensure => present,
		}

	schedule { 'system-daily':
			period => daily,
			range  => '00:00 - 01:00',
		}

	exec { $systemupdate: 
		schedule => 'system-daily'
		}
}
