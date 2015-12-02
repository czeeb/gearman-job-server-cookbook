#
# Cookbook Name:: gearman-job-server
# Recipe:: service
#
# Copyright (c) 2015 Chris Zeeb <chris.zeeb@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# TODO Fix bug where if daemon cannot start the config file cannot be fixed.
service 'gearman-job-server' do
  action [:enable, :start]
  supports :restart => true
  case node['platform_family']
  when 'debian'
    service_name 'gearman-job-server'
  when 'rhel'
    service_name 'gearmand'
  end
end
