# Install required packages to use tokyo cabinet

node['packages'][node['platform']][node['platform_version']].each do |pkg, flag|
  package pkg if flag
end
