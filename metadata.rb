name             'gearman'
maintainer       'Chris Zeeb'
maintainer_email 'chris.zeeb@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures gearman job server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
issues_url       'https://github.com/czeeb/gearman-job-server-cookbook/issues' if respond_to?(:issues_url)
source_url       'https://github.com/czeeb/gearman-job-server-cookbook' if respond_to?(:source_url)
version          '1.0.0'

supports 'amazon'
supports 'centos', '>= 6.6'
supports 'debian', '>= 7.8'
supports 'redhat', '>= 6.6'
supports 'ubuntu', '>= 12.04'

# 2.7 is required for Debian 8 support
depends 'apt', '~> 2.7'
