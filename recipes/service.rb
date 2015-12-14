#
# Cookbook Name:: gearman
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

include_recipe 'gearman::config'

# TODO: Investigate using the systemd chef cookbook instead
execute 'systemd-daemon-reload' do
  only_if { node['platform'] == 'debian' && node['platform_version'].to_f > 8.0 }
  command 'systemctl daemon-reload'
  action :run
  subscribes :run, 'template[gearman-init]', :delayed
end

service 'gearman-job-server' do
  action [:enable, :start]
  supports :restart => true, :start => true, :stop => true
  case node['platform_family']
  when 'debian'
    service_name 'gearman-job-server'
  when 'rhel'
    service_name 'gearmand'
  end
  subscribes :stop, 'template[gearman-config]', :delayed
  subscribes :start, 'template[gearman-config]', :delayed
  if node['platform'] == 'debian' && node['platform_version'].to_f > 8.0
    subscribes :stop, 'template[gearmand-init]', :delayed
    subscribes :start, 'template[gearmand-init]', :delayed
  end
end
