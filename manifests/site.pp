define apt_repo($entry, $key_url) {
  file { "/etc/apt/sources.list.d/$title.list":
    content => "$entry"
  }

  exec { "Install key for $title":
    command => "wget -q -O - $key_url | apt-key add -",
    path => "/bin:/usr/bin",
    unless => "apt-key list | egrep -i '^uid *$title'"
  }
}

exec { "Create the file /tmp/hello_puppet":
  cwd     => "/tmp",
  command => $operatingsystem ? { Ubuntu => "echo 'Hello Ubuntu' > hello_puppet", default => "echo 'Hello, linux' > hello_puppet" },
  path    => "/bin",
  unless  => "grep Hello /tmp/hello_puppet"
}

file { "/etc/hosts":
  source => "puppet:///configuration/hosts"
}

package { "apache2":
  ensure => present
}

apt_repo { "brightbox":
  entry => "deb http://apt.brightbox.net hardy main",
  key_url => "http://apt.brightbox.net/release.asc"
}

package { "libapache2-mod-passenger":
  ensure => present,
  require => Apt_repo["brightbox"]
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

service { "apache2":
  ensure => running
}


