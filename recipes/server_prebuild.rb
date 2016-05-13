include_recipe 'zabbix::server_common'
include_recipe 'zabbix::common'
include_recipe 'zabbix::repo'

case node['zabbix']['database']['install_method']
when 'mysql', 'rds_mysql'
  packages = ['zabbix-server-mysql', 'zabbix-web-mysql']
end

packages.each do |pck|
  package pck do
    action :install
  end
end

template "#{node['zabbix']['etc_dir']}/zabbix_server.conf" do
  source 'zabbix_prebuild_server.conf.erb'
  owner 'root'
  group 'root'
  mode '644'
  variables(
       :dbhost             => node['zabbix']['database']['dbhost'] ,
       :dbname             => node['zabbix']['database']['dbname'],
       :dbuser             => node['zabbix']['database']['dbuser'],
       :dbpassword         => node['zabbix']['database']['dbpassword'],
       :dbport             => node['zabbix']['database']['dbport'],
  )
end

directory node['zabbix']['install_dir']

service 'zabbix-server' do
  supports :status => true, :start => true, :stop => true, :restart => true
  action [:start, :enable]
end