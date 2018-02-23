# create files to mock testtype resource instances
# testtype uses a file for simple absent/present destroy/create idempotency demo
testtype { 'testtype1' :
  ensure => present,
}
testtype { 'testtype2' :
  ensure => present
}
testtype { 'testtype3' :
  ensure => present
}
