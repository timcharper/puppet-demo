class general {
  file { "/etc/hosts":
    source => "puppet:///configuration/hosts"
  }

  apt_repo { "brightbox":
    entry => "deb http://apt.brightbox.net hardy main",
    key_url => "http://apt.brightbox.net/release.asc"
  }

  package { "ruby-dev":
    ensure => present
  }

  package { "build-essential":
    ensure => present
  }

  package { "fastthread":
    ensure => present,
    provider => "gem",
    require => [Package["ruby-dev"], Package["build-essential"]]
  }
}

