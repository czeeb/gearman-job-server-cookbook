#
# Cookbook Name:: gearman-job-server
# Recipe:: config
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

include_recipe 'gearman-job-server::service'

# Map parameters and discard nil k/v pairs
params = node['gearman-job-server']['parameters'].reject { |_k, v| v.nil? }.map { |k, v| "--#{k}=#{v}" }.join(' ')

# If a persistent queue-type is set, add the queue types parameters in and discard nil k/v pairs.
if node['gearman-job-server']['parameters']['queue-type']
  q = node['gearman-job-server']['parameters']['queue-type']
  params = params + ' ' + node['gearman-job-server'][q].reject { |_k, v| v.nil? }.map { |k, v| "--#{q}-#{k}=#{v}" }.join(' ')
end

# TODO: Add toggle for if gearman should be restarted when config changes.
template 'gearman-config' do
  source 'gearman-config.erb'
  case node['platform_family']
  when 'debian'
    path '/etc/default/gearman-job-server'
    variables(
      :param_word => 'PARAMS',
      :params     => params
    )
  when 'rhel'
    path '/etc/sysconfig/gearmand'
    variables(
      :param_word => 'OPTIONS',
      :params     => params
    )
  end
end
