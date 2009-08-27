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

include general
include passenger
