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

## Tested Queue Types and Distros

An X indicates that the queue type for the distro is supported.  Different packages support different queue types because they had different compile time options and libraries used.

|              | Drizzle | Memcached | MySQL | Postgres | SQLite3 | Tokyo Cabinet |
|--------------|:-------:|:---------:|:-----:|:--------:|:-------:|:-------------:|
| CentOS 6.6   |         |           | X     | X        | X       | X             |
| CentOS 7.1   |         |           | X     | X        | X       | X             |
| Debian 7.8   |         | X         |       |          | X       |               |
| Debian 8.1   |         | X         | X     | X        | X       |               |
| Ubuntu 12.04 |         |           |       | X        | X       | X             |
| Ubuntu 14.04 |         | X         | X     | X        | X       |               |

## Attributes

Please see [gearman documentation](http://gearman.org/manual/job_server/#options) for what each of these options do.

* `default['gearman']['parameters']['backlog']` - Number of backlog connections for listen.
* `default['gearman']['parameters']['file-descriptors']` - Number of file descriptors to allow for the process.  Default is max allowed for users.
* `default['gearman']['parameters']['job-retries']` - Number of attempts to run the job before the job server removes it.  Default is no limit.
* `default['gearman']['parameters']['log-file']` - Log file to write errors and information to.
* `default['gearman']['parameters']['listen']` - Address the server should listen on. Default is INADDR_ANY.
* `default['gearman']['parameters']['port']` - Port the server should listen on.  Default is 4730.
* `default['gearman']['parameters']['threads']` - Number of I/O threads to use.  Default = 0
* `default['gearman']['parameters']['user']` - Switch to given user after startup

* `default['gearman']['queue-type']` - Persistent queue type to use. Valid options are libdrizzle, libmemcached, libsqlite3, libpq, mysql

* `default['gearman']['libdrizzle']['host']` - Host of server
* `default['gearman']['libdrizzle']['port']` - Port of server
* `default['gearman']['libdrizzle']['uds']` - Unix domain socket for server
* `default['gearman']['libdrizzle']['user']` - User name for authentication
* `default['gearman']['libdrizzle']['password']` - Password for authentication
* `default['gearman']['libdrizzle']['db']` - Database to use
* `default['gearman']['libdrizzle']['table']` - Table to use
* `default['gearman']['libdrizzle']['mysql']` - Set to true to use MySQL protocol

* `default['gearman']['libmemcached']['servers']` - List of memcached servers to use.

* `default['gearman']['libsqlite3']['db']` - Database file to use
* `default['gearman']['libsqlite3']['table']` - Table to use

* `default['gearman']['libpq']['conninfo']` - PostgreSQL connection information string
* `default['gearman']['libpq']['table']` - Table to use

* `default['gearman']['mysql']['host']` - Host of server
* `default['gearman']['mysql']['port']` - Port of server
* `default['gearman']['mysql']['user']` - User for authentication
* `default['gearman']['mysql']['password']` - Password for authentication
* `default['gearman']['mysql']['db']` - Database to use
* `default['gearman']['mysql']['table']` - Table to use

## Usage
#### gearman::default

e.g.
Just include `gearman` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[gearman]"
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

## Helpful Stuff

* [Shared Serverspec Tests](https://gist.github.com/pburkholder/a9cdde0b33be8d5e3c08) - Explains why the serverspec tests are set up the way the are.

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