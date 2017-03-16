class base::param {
	case $::osfamily {
		'RedHat' : {$ssh_name = 'sshd' }
		'Debian' : {$ssh_name = 'ssh' }
		defaults: {fail ('OS is not support by puppet module SSH')}
		}
$author = "amy"

}
