actions :call
default_action :call

attribute :server_connection, :kind_of => Hash, :required => true
attribute :cmethod, :kind_of => [String, Symbol], :required => true
attribute :parameters, :kind_of => Hash, :required => true
