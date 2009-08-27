import "classes/*.pp"
import "types/*.pp"

Exec {
  path => "/bin:/usr/bin"
}

exec { "Create the file /tmp/hello_puppet":
  cwd     => "/tmp",
  command => $operatingsystem ? { Ubuntu => "echo 'Hello Ubuntu' > hello_puppet", default => "echo 'Hello, linux' > hello_puppet" },
  unless  => "grep Hello /tmp/hello_puppet"
}

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

include passenger
