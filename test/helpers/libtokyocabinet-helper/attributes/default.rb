# Why not arrays instead of hashes?
# https://coderanger.net/arrays-and-chef/

# TODO: Make this less specific

default['packages']['centos']['6.6'] = {
  'tokyocabinet' => true
}

default['packages']['centos']['7.1.1503'] = {
  'tokyocabinet' => true
}

default['packages']['debian']['7.8'] = {
  'libtokyocabinet9' => true,
  'tokyocabinet-bin' => true
}

default['packages']['debian']['8.1'] = {
  'libtokyocabinet9' => true,
  'tokyocabinet-bin' => true
}

default['packages']['ubuntu']['12.04'] = {
  'libtokyocabinet8' => true,
  'tokyocabinet-bin' => true
}

default['packages']['ubuntu']['14.04'] = {
  'libtokyocabinet9' => true,
  'tokyocabinet-bin' => true
}

default['gearman-job-server']['parameters']['queue-type'] = 'libtokyocabinet'
default['gearman-job-server']['libtokyocabinet']['file'] = '/tmp/gearman.tch'
