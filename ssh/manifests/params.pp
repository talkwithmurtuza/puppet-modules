class ssh::params {
  case $::osfamily  {
    'Debian' : {
      $package_name = 'openssh-server'
      $service_name = 'ssh'
    }
    'RedHat' : {
      $package_name = 'openssh-server'
      $service_name = 'sshd'
    }
    default: {
        fail("${facts['operatingsystem']} is not supported!")
    }
  }
}
