include_attribute 'zabbix'

default['zabbix']['proxy']['install_method'] = 'source'
default['zabbix']['proxy']['hostname'] = node['fqdn']
default['zabbix']['proxy']['config']['ConfigFrequency'] = 60
default['zabbix']['proxy']['start_trappers'] = 5
default['zabbix']['proxy']['start_pingers'] = 1
default['zabbix']['proxy']['timeout'] = '3'
default['zabbix']['proxy']['cache_size'] = '8M' # default 8MB
default['zabbix']['proxy']['servers'] = []
default['zabbix']['proxy']['housekeeping_frequency'] = 1
default['zabbix']['proxy']['log_queries'] = 0
default['zabbix']['proxy']['start_pollers'] = 5
default['zabbix']['proxy']['StartPollersUnreachable'] = 1
default['zabbix']['proxy']['log_file'] = '/var/log/zabbix/zabbix_proxy.log'
default['zabbix']['proxy']['externalscriptspath'] = '/etc/zabbix/externalscripts'
default['zabbix']['proxy']['pid_file'] = '/var/run/zabbix/zabbix_proxy.pid'
default['zabbix']['proxy']['start_discoverers'] = 1
default['zabbix']['proxy']['data_sender_frequency'] = 1

default['zabbix']['proxy']['additional_parameters'] = {}
