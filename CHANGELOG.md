# gearman-job-server-cookbook CHANGELOG

This file is used to list changes made in each version of the gearman cookbook.

## 1.0.0 / 2015-12-14

Rewrite of gearman cookbook

### Added

* Support for Amazon, CentOS, and RedHat
* `['gearman']['server']` options moved to `['gearman']['parameters']` 

### Changed

* Install from O/S packages instead of pulling package from github repository
* Added configuration options for:
  * backlog
  * file-descriptors
  * job-retries
  * log-file
  * listen
  * threads
  * queue-type
    * libdrizzle - all options
    * libmemcached - all options
    * libsqlite3 - all options
    * libpq - all options
    * mysql - all options
  

### Removed

* Installing gearman-ruby gem

## 0.0.1 / 2011-02-17

* Initial release.  The original cookbook can be found [here](https://github.com/gofullstack/gearman-cookbook).  The 1.0.0 release is a complete rewrite.
