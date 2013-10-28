#
# Author::  Benjamin Clay (<bclay@jolicode.com>)
# Cookbook Name:: php
#
pkg = case node["platform_family"]
      when "rhel", "fedora" then 'php-pecl-xdebug'
      when "debian" then 'php5-xdebug'
      else 'php5-xdebug' # untested, so might be wrong
      end

filename = if platform?("ubuntu") then '20-xdebug.ini' else 'xdebug.ini' end

package pkg

template "#{node['jolicode-php']['real_conf_dir']}/#{filename}" do
  source "xdebug.ini.erb"
  owner "root"
  group "root"
  mode "0644"
end