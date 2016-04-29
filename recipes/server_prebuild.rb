# 1 rpm -ivh http://repo.zabbix.com/zabbix/3.0/rhel/7/x86_64/zabbix-release-3.0-1.el7.noarch.rpm
# 2
# 3
rpm_version = node['zabbix']['server']['version'].rpartition(".")[0]
rpm_package "zabbix" do
  source "http://repo.zabbix.com/zabbix/#{rpm_version}/rhel/#{node['platform_version_int']}/x86_64/zabbix-release-#{rpm_version}-1.el#{node['platform_version_int']}.noarch.rpm"
  action :install
end

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
