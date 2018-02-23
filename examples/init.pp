# mastertype demonstrates property states - particularly boolean munging of
# all false values to nil on boolean provider properties
# mastertype { 'destroymaster' :
#   ensure => absent
# }
#
# -> mastertype { 'createmaster' :
#   ensure => present
# }
#
# -> mastertype { 'boolpropnotset-to-false' :
#   ensure         => present,
#   stringpropset  => 'my stringpropset',
#   boolpropnotset => false
# }
#
# -> mastertype { 'boolpropnotset-to-true' :
#   ensure         => present,
#   stringpropset  => 'my stringpropset',
#   boolpropnotset => true
# }
#
# -> mastertype { 'boolproptrue-to-false' :
#   ensure        => present,
#   stringpropset => 'my stringpropset',
#   boolproptrue  => false
# }
#
# -> mastertype { 'boolproptrue-to-undef' :
#   ensure        => present,
#   stringpropset => 'my stringpropset',
#   boolproptrue  => undef
# }
#
# -> mastertype { 'boolpropfalse-to-true' :
#   ensure        => present,
#   stringpropset => 'my stringpropset',
#   boolpropfalse => true
# }
#
# -> mastertype { 'boolpropfalse-to-undef' :
#   ensure        => present,
#   stringpropset => 'my stringpropset',
#   boolpropfalse => undef
# }
#
# -> mastertype { 'stringpropnotset-to-set-nochange' :
#   ensure           => present,
#   stringpropset    => 'my stringpropset',
#   stringpropnotset => 'my stringpropnotset'
# }
#
# -> mastertype { 'stringpropnotset-change' :
#   ensure           => present,
#   stringpropset    => 'my stringpropset',
#   stringpropnotset => 'my new stringpropnotset',
# }
#
# -> mastertype { 'stringpropset-change' :
#   ensure        => present,
#   stringpropset => 'my new stringpropset'
# }
#
# -> mastertype { 'boolproptruemunge-to-false' :
#   ensure            => present,
#   stringpropset     => 'my stringpropset',
#   boolproptruemunge => false
# }
#
# -> mastertype { 'boolproptruemunge-to-undef' :
#   ensure            => present,
#   stringpropset     => 'my stringpropset',
#   boolproptruemunge => undef
# }
#
# -> mastertype { 'boolpropfalsemunge-to-true' :
#   ensure             => present,
#   stringpropset      => 'my stringpropset',
#   boolpropfalsemunge => true
# }
#
# -> mastertype { 'boolpropfalsemunge-to-undef' :
#   ensure             => present,
#   stringpropset      => 'my stringpropset',
#   boolpropfalsemunge => undef
# }

# mastertype demo of using global variables to pass dynamic values from master resource to slave resource
mastertype { 'defaultmaster' :
  ensure        => present,
  stringpropset => 'my stringpropset'
}
-> slavetype { 'defaultslave' :
  ensure => present,
  master => 'defaultmaster'
}

mastertype { 'boolpropnotset-to-false' :
  ensure         => present,
  stringpropset  => 'my stringpropset',
  boolpropnotset => false
}
-> slavetype { 'boolpropnotset-to-false' :
  ensure => present,
  master => 'boolpropnotset-to-false'
}

mastertype { 'boolpropnotset-to-true' :
  ensure         => present,
  stringpropset  => 'my stringpropset',
  boolpropnotset => true
}
-> slavetype { 'boolpropnotset-to-true' :
  ensure => present,
  master => 'boolpropnotset-to-true'
}

mastertype { 'boolproptrue-to-false' :
  ensure        => present,
  stringpropset => 'my stringpropset',
  boolproptrue  => false
}
-> slavetype { 'boolproptrue-to-false' :
  ensure => present,
  master => 'boolproptrue-to-false'
}

mastertype { 'boolproptrue-to-undef' :
  ensure        => present,
  stringpropset => 'my stringpropset',
  boolproptrue  => undef
}
-> slavetype { 'boolproptrue-to-undef' :
  ensure => present,
  master => 'boolproptrue-to-undef'
}

mastertype { 'boolpropfalse-to-true' :
  ensure        => present,
  stringpropset => 'my stringpropset',
  boolpropfalse => true
}
-> slavetype { 'boolpropfalse-to-true' :
  ensure => present,
  master => 'boolpropfalse-to-true'
}

mastertype { 'boolpropfalse-to-undef' :
  ensure        => present,
  stringpropset => 'my stringpropset',
  boolpropfalse => undef
}
-> slavetype { 'boolpropfalse-to-undef' :
  ensure => present,
  master => 'boolpropfalse-to-undef'
}

mastertype { 'stringpropnotset-to-set-nochange' :
  ensure           => present,
  stringpropset    => 'my stringpropset',
  stringpropnotset => 'my stringpropnotset'
}
-> slavetype { 'stringpropnotset-to-set-nochange' :
  ensure => present,
  master => 'stringpropnotset-to-set-nochange'
}

mastertype { 'stringpropnotset-change' :
  ensure           => present,
  stringpropset    => 'my stringpropset',
  stringpropnotset => 'my new stringpropnotset',
}
-> slavetype { 'stringpropnotset-change' :
  ensure => present,
  master => 'stringpropnotset-change'
}

mastertype { 'stringpropset-change' :
  ensure        => present,
  stringpropset => 'my new stringpropset'
}
-> slavetype { 'stringpropset-change' :
  ensure => present,
  master => 'stringpropset-change'
}

mastertype { 'boolproptruemunge-to-false' :
  ensure            => present,
  stringpropset     => 'my stringpropset',
  boolproptruemunge => false
}
-> slavetype { 'boolproptruemunge-to-false' :
  ensure => present,
  master => 'boolproptruemunge-to-false'
}

mastertype { 'boolproptruemunge-to-undef' :
  ensure            => present,
  stringpropset     => 'my stringpropset',
  boolproptruemunge => undef
}
-> slavetype { 'boolproptruemunge-to-undef' :
  ensure => present,
  master => 'boolproptruemunge-to-undef'
}

mastertype { 'boolpropfalsemunge-to-true' :
  ensure             => present,
  stringpropset      => 'my stringpropset',
  boolpropfalsemunge => true
}
-> slavetype { 'boolpropfalsemunge-to-true' :
  ensure => present,
  master => 'boolpropfalsemunge-to-true'
}

mastertype { 'boolpropfalsemunge-to-undef' :
  ensure             => present,
  stringpropset      => 'my stringpropset',
  boolpropfalsemunge => undef
}
-> slavetype { 'boolpropfalsemunge-to-undef' :
  ensure => present,
  master => 'boolpropfalsemunge-to-undef'
}
