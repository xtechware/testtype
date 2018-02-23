# create files to mock testtype resource instances
# testtype uses a file for simple absent/present destroy/create idempotency demo
testtype { 'testtype1' :
  ensure => absent,
}
testtype { 'testtype2' :
  ensure => absent
}
testtype { 'testtype3' :
  ensure => absent
}
