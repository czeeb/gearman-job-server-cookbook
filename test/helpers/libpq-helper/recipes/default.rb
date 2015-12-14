# install database
include_recipe 'postgresql::server'

# https://github.com/chef-cookbooks/database#resourcesproviders
include_recipe 'database::postgresql'

# create database
postgresql_database 'gearmand' do
  connection(
    :host      => '127.0.0.1',
    :username  => 'postgres',
    :password  => node['libpq-helper']['pq']['password_plain']
  )
  action :create
end

# This is a terrible terrible way to do this
# But for now this is just a helper recipe, so it just needs to work
case node['platform_family']
when 'rhel'
  if node['platform_version'].to_f < 7.0
    node.default['gearman']['libpq']['conninfo'] = '\'user=postgres password=iloverandompasswordsbutthiswilldo hostaddr=127.0.0.1 port=5432 dbname=gearmand\''
  else
    node.default['gearman']['libpq']['conninfo'] = 'postgresql://postgres:iloverandompasswordsbutthiswilldo@127.0.0.1:5432/gearmand'
  end
when 'debian'
  if node['platform'] == 'ubuntu' && node['platform_version'].to_f <= 12.04
    node.default['gearman']['libpq']['conninfo'] = 'user=postgres password=iloverandompasswordsbutthiswilldo hostaddr=127.0.0.1 port=5432 dbname=gearmand'
  else
    node.default['gearman']['libpq']['conninfo'] = 'postgresql://postgres:iloverandompasswordsbutthiswilldo@127.0.0.1:5432/gearmand'
  end
end

include_recipe 'gearman'
