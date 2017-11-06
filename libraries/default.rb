class Chef
  class Recipe
      def zabbix_php_packages(packages)
        if node['zabbix']['server']['php']['version'] != 'default'
          case node['platform']
            when 'redhat', 'centos', 'scientific', 'amazon', 'oracle'
              packages.map { |d| (d.start_with?('php-') || d == 'php') ? "php#{node['zabbix']['server']['php']['version']}-" + d : d}
          end
        end
      end
  end
end
