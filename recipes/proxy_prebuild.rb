# Author:: Nacer Laradji (<nacer.laradji@gmail.com>)
# Cookbook Name:: zabbix
# Recipe:: server
#
# Copyright 2011, Efactures
#
# Apache 2.0
#

include_recipe 'zabbix::repo'

['zabbix-proxy-mysql'].each do |pkg|
  package pkg
end
