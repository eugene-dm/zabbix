# Author:: Nacer Laradji (<nacer.laradji@gmail.com>)
# Cookbook Name:: zabbix
# Recipe:: server
#
# Copyright 2011, Efactures
#
# Apache 2.0
#

# include_recipe "zabbix::proxy_#{node['zabbix']['server']['install_method']}"
include_recipe 'zabbix::server_common'
include_recipe 'zabbix::common'
include_recipe "zabbix::proxy_#{node['zabbix']['proxy']['install_method']}"
node.normal['zabbix']['role'] = 'proxy'
include_recipe 'zabbix::database'

template "#{node['zabbix']['etc_dir']}/zabbix_proxy.conf" do
  variables(
      :dbhost => node['zabbix']['database']['dbhost'],
      :dbname => node['zabbix']['database']['dbname'],
      :dbuser => node['zabbix']['database']['dbuser'],
      :dbpassword => node['zabbix']['database']['dbpassword'],
      :dbport => node['zabbix']['database']['dbport'],
      :java_gateway => node['zabbix']['server']['java_gateway'],
      :java_gateway_port => node['zabbix']['server']['java_gateway_port'],
      :java_pollers => node['zabbix']['server']['java_pollers'],
      :start_trappers => node['zabbix']['proxy']['start_trappers'],
      :start_pingers => node['zabbix']['proxy']['start_pingers']
  )
end