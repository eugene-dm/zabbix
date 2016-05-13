# 1 rpm -ivh http://repo.zabbix.com/zabbix/3.0/rhel/7/x86_64/zabbix-release-3.0-1.el7.noarch.rpm
# 2
# 3
rpm_version = node['zabbix']['server']['version'].rpartition(".")[0]
rpm_package "zabbix" do
  source "http://repo.zabbix.com/zabbix/#{rpm_version}/rhel/#{node['platform_version_int']}/x86_64/zabbix-release-#{rpm_version}-1.el#{node['platform_version_int']}.noarch.rpm"
  action :install
end
