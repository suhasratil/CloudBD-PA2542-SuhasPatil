node 'appserver' {

exec { 'apt-get update':
  command => '/usr/bin/apt-get update'
}

#exec {"install-curl":
#command => "sudo apt-get install curl",
#path => "/usr/bin/:/usr/local/bin/:/bin/"
#}

package { "curl":

  ensure  => present,

  require => Exec["apt-get update"],
}

exec { "getcurl":
require => Package["curl"],
command => "curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -",
}

package { 'nodejs':
    ensure  => present,
    require => Exec["getcurl"],
  }

package {"npm":

ensure => present,
 require => Exec["apt-get update"],
}

}


node 'dbserver' {

exec { "apt-get update":
  path => "/usr/bin",
}

  package { "mysql-server":
        ensure => installed,
        require => Exec["apt-get update"],
}

service { 'mysql':
  ensure => running,
}
}


