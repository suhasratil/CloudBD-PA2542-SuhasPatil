node 'appserver' {
exec { "apt-get update":

  path => "/usr/bin",

}
package { 'nodejs':
    ensure              => present,
    require => Exec["apt-get update"],
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

}


