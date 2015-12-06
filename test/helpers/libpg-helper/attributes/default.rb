default['libpg-helper']['pg']['password_plain'] = 'iloverandompasswordsbutthiswilldo'

# iloverandompasswordsbutthiswilldo
default['postgresql']['password']['postgres'] = 'md5d4dd6397cf55a4507874c3864f092a8c'

# gearmand options
default['gearman-job-server']['parameters']['queue-type'] = 'Postgres'

default['gearman-job-server']['libpq']['conninfo'] = 'postgresql://postgres:iloverandompasswordsbutthiswilldo@127.0.0.1:5432/gearmand'
