include_attribute 'zabbix'

default['zabbix']['proxy']['install_method'] = 'source'
default['zabbix']['proxy']['hostname'] = node['fqdn']
default['zabbix']['proxy']['config']['ConfigFrequency'] = 60