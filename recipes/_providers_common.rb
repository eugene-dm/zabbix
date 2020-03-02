chef_gem 'zabbixapi' do
  action :install
  #version '~> 0.6.3'
  compile_time true
end
require 'zabbixapi'