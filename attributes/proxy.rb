include_attribute 'zabbix'

default['zabbix']['proxy']['install_method'] = 'source'
default['zabbix']['proxy']['hostname'] = node['fqdn']
default['zabbix']['proxy']['config']['ConfigFrequency'] = 60
default['zabbix']['proxy']['start_trappers'] = 5
default['zabbix']['proxy']['start_pingers'] = 1
default['zabbix']['proxy']['timeout'] = '3'
default['zabbix']['proxy']['cache_size'] = '8M' # default 8MB
default['zabbix']['proxy']['servers'] = []