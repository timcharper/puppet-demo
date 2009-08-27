import "classes/*.pp"
import "types/*.pp"

Exec {
  path => "/bin:/usr/bin"
}

node "puppet" {
  include general
  include passenger
}
node "dbserver" {
  include general
  # include mysql
}
