define apt_repo($entry, $key_url) {
  file { "/etc/apt/sources.list.d/$title.list":
    content => "$entry"
  }

  exec { "Install key for $title":
    command => "wget -q -O - $key_url | apt-key add -",
    unless => "apt-key list | egrep -i '^uid *$title'"
  }
}

