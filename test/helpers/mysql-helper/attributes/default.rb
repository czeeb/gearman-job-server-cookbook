# MySQL options
default['mysql-helper']['mysql']['name'] = 'default'

# gearmand options
default['gearman-job-server']['parameters']['queue-type'] = 'mysql'

default['gearman-job-server']['mysql']['host'] = '127.0.0.1'
default['gearman-job-server']['mysql']['user'] = 'root'
default['gearman-job-server']['mysql']['password'] = 'root'
default['gearman-job-server']['mysql']['db'] = 'gearmand'
