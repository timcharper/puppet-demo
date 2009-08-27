import "classes/*.pp"
import "types/*.pp"

Exec {
  path => "/bin:/usr/bin"
}

node "puppet" {
  include general
  include passenger
}
