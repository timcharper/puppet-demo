class passenger {
  package {
    "apache2": ensure => present;
    "libapache2-mod-passenger": ensure => present, require => Apt_repo["brightbox"];
  }

  service { "apache2":
    ensure => running
  }

  exec { "enable passenger":
    command => "ln -s /etc/apache2/mods-available/passenger.conf /etc/apache2/mods-enabled/passenger.conf",
    creates => "/etc/apache2/mods-enabled/passenger.conf",
    require => [Package["libapache2-mod-passenger"]]
  }
}
