exec { "Create the file /tmp/hello_puppet":
  cwd     => "/tmp",
  command => $operatingsystem ? { Ubuntu => "echo 'Hello Ubuntu' > hello_puppet", default => "echo 'Hello, linux' > hello_puppet" },
  path    => "/bin",
  unless  => "grep Hello /tmp/hello_puppet"
}

