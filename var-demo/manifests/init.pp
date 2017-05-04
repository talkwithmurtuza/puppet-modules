class var-demo
{

$osversion = 'redhat7'

if $osversion == 'redhat6'
{
    package {'ntp':
                ensure => present,
                before => Service['ntpd'], }

    service {'ntpd':
                ensure  => running,
                require => [
                            Package['ntp'],
                            File['/etc/ntp.conf'],
                                          ],  }
    file {'/etc/ntp.conf':
                ensure => file,
                mode   => 0644,
                source => 'puppet:///module/var-demo/ntpd.conf',
                before => Service['ntpd'],            }

}
else
{
        package {'chrony':
                ensure => present,
                before => Service['chronyd'],  }

        service {'chronyd':
                ensure  => running,
                require => [
                            Package['chronyd'],
                            File['/etc/chrony.conf'],
                                  ],  }
        file {'/etc/ntp.conf':
                ensure => file,
                mode   => 0644,
                source => 'puppet:///module/var-demo/chrony.conf',
                before => Service['chronyd'],      }
}

}
