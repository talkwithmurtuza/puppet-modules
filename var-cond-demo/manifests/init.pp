class var-cond-demo
{

$osversion = 'redha7'

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
                source => 'puppet:///modules/var-cond-demo/ntp.conf',
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
                            Package['chrony'],
                            File['/etc/chrony.conf'],
                                  ],  }
        file {'/etc/chrony.conf':
                ensure => file,
                mode   => 0644,
                source => 'puppet:///modules/var-cond-demo/chrony.conf',
                before => Service['chronyd'],      }
}

}
