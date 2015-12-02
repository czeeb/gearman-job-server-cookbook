# Gearman Job Server Chef Cookbook

[![Build Status](https://travis-ci.org/czeeb/gearman-job-server-cookbook.svg?branch=master)](https://travis-ci.org/czeeb/gearman-job-server-cookbook)
[![Dependency Status](https://gemnasium.com/czeeb/gearman-job-server-cookbook.svg)](https://gemnasium.com/czeeb/gearman-job-server-cookbook)
[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/czeeb/gearman-job-server-cookbook?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

This is a [Chef] cookbook to manage [Gearman]

## Platforms
The following platforms and versions are tested and supported using [test-kitchen](http://kitchen.ci/)

* CentOS 6.6, 7.1
* Debian 7.8, 8.1
* Ubuntu 12.04, 14.04

Other versions that should work fine but are not testing in [test-kitchen].

* Amazon Linux 2015-03
* RHEL >= 6.6

## Attributes

Please see [gearman documentation](http://gearman.org/manual/job_server/#options) for what each of these options do.

* `default['gearman-job-server']['parameters']['backlog']` - Number of backlog connections for listen.
* `default['gearman-job-server']['parameters']['file-descriptors']` - Number of file descriptors to allow for the process.  Default is max allowed for users.
* `default['gearman-job-server']['parameters']['job-retries']` - Number of attempts to run the job before the job server removes it.  Default is no limit.
* `default['gearman-job-server']['parameters']['log-file']` - Log file to write errors and information to.
* `default['gearman-job-server']['parameters']['listen']` - Address the server should listen on. Default is INADDR_ANY.
* `default['gearman-job-server']['parameters']['port']` - Port the server should listen on.  Default is 4730.
* `default['gearman-job-server']['parameters']['threads']` - Number of I/O threads to use.  Default = 0
* `default['gearman-job-server']['parameters']['user']` - Switch to given user after startup

* `default['gearman-job-server']['queue-type']` - Persistent queue type to use. Valid options are libdrizzle, libmemcached, libsqlite3, libpq, mysql

* `default['gearman-job-server']['libdrizzle']['host']` - Host of server
* `default['gearman-job-server']['libdrizzle']['port']` - Port of server
* `default['gearman-job-server']['libdrizzle']['uds']` - Unix domain socket for server
* `default['gearman-job-server']['libdrizzle']['user']` - User name for authentication
* `default['gearman-job-server']['libdrizzle']['password']` - Password for authentication
* `default['gearman-job-server']['libdrizzle']['db']` - Database to use
* `default['gearman-job-server']['libdrizzle']['table']` - Table to use
* `default['gearman-job-server']['libdrizzle']['mysql']` - Set to true to use MySQL protocol

* `default['gearman-job-server']['libmemcached']['servers']` - List of memcached servers to use.

* `default['gearman-job-server']['libsqlite3']['db']` - Database file to use
* `default['gearman-job-server']['libsqlite3']['table']` - Table to use

* `default['gearman-job-server']['libpq']['conninfo']` - PostgreSQL connection information string
* `default['gearman-job-server']['libpq']['table']` - Table to use

* `default['gearman-job-server']['mysql']['host']` - Host of server
* `default['gearman-job-server']['mysql']['port']` - Port of server
* `default['gearman-job-server']['mysql']['user']` - User for authentication
* `default['gearman-job-server']['mysql']['password']` - Password for authentication
* `default['gearman-job-server']['mysql']['db']` - Database to use
* `default['gearman-job-server']['mysql']['table']` - Table to use

## Usage
#### gearman-job-server::default

e.g.
Just include `gearman-job-server` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[gearman-job-server]"
  ]
}
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github to the development branch

## License and Authors
Authors: Chris Zeeb <chris.zeeb@gmail.com> and [Contributors]

```text
Copyright:: 2015 Chris Zeeb <chris.zeeb@gmail.com>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

[Chef]: https://www.chef.io
[Gearman]: http://gearman.org/
[Contributors]: https://github.com/czeeb/gearman-job-server-cookbook/graphs/contributors