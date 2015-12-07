mysql_service node['mysql-helper']['mysql']['name'] do
  bind_address '0.0.0.0'
  port '3306'
  initial_root_password 'root'
  action [:create, :start]
end

mysql_client node['mysql-helper']['mysql']['name'] do
  action :create
end

# https://github.com/chef-cookbooks/database#resourcesproviders
mysql2_chef_gem 'default'

mysql_database node['gearman-job-server']['mysql']['db'] do
  connection(
    :host     => '127.0.0.1',
    :socket   => "/var/run/mysql-#{node['mysql-helper']['mysql']['name']}/mysqld.sock",
    :username => 'root',
    :password => 'root'
  )
  action :create
end

include_recipe 'gearman-job-server'
