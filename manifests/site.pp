import "classes/*.pp"
import "types/*.pp"

Exec {
  path => "/bin:/usr/bin"
}

include general
include passenger
