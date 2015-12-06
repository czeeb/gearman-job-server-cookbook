# install database
include_recipe 'postgresql::server'

# https://github.com/chef-cookbooks/database#resourcesproviders
include_recipe 'database::postgresql'

# create database
postgresql_database 'gearmand' do
  connection(
    :host      => '127.0.0.1',
    :username  => 'postgres',
    :password  => node['libpg-helper']['pg']['password_plain']
  )
  action :create
end

include_recipe 'gearman-job-server'
