#actions :create
default_action :create
provides :zabbix_database
#attr_accessor :exists

#def initialize(name, run_context = nil)
#  super
#  @provider ||= Chef::Provider::ZabbixDatabaseMySql
#end

property :dbname, String, :name_property => true
property :host, String, :required => true
property :port, Integer, :required => true
property :username, String, :required => true
property :password, String, :required => true
property :root_username, String, :required => true
property :root_password, String, :required => true
property :allowed_user_hosts, String, :default => ''

property :server_version, String, :required => true
property :source_url, String, :required => true
property :source_dir, String, :required => true
property :install_dir, String, :required => true
property :branch, String, :required => false
property :version, String, :required => false
