exec { "Create the file /tmp/hello_puppet":
  cwd     => "/tmp",
  command => "echo 'Hello Puppet' > hello_puppet",
  path    => "/bin",
  unless  => "grep Hello /tmp/hello_puppet"
}

