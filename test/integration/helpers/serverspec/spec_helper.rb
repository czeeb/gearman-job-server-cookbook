require 'serverspec'
require 'pathname'
require 'json'

set :backend, :exec

$node = ::JSON.parse(File.read('/tmp/serverspec/node.json'))
