#
# Cookbook Name:: usergrid
# Recipe:: portal
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'nodejs::nodejs_from_package'
include_recipe 'nginx'

usergrid_root = node[:usergrid][:install_root]

nginx_user = node[:nginx][:user]
nginx_group = node[:nginx][:group]
nginx_root = '/var/www/nginx-default' #node[:nginx][:default_root]  (need newer version of nginx cookbook for this attribute)

git "#{usergrid_root}" do
	user 'root'
  repository "#{node['usergrid']['git']['repository']}"
  reference "#{node['usergrid']['git']['branch']}"
  action :export
  depth 1
  not_if do ::File.exists?("#{usergrid_root}") end
end

execute 'build_portal' do
  command './build.sh'
  creates "#{usergrid_root}/portal/dist/usergrid-portal"
  cwd "#{usergrid_root}/portal"
end

directory "#{::File.dirname(nginx_root)}" do
  owner "#{nginx_user}"
  group "#{nginx_group}"
  mode '0755'
  action :create
end

link "#{nginx_root}" do
  to "#{usergrid_root}/portal/dist/usergrid-portal"
  owner "#{nginx_user}"
  group "#{nginx_group}"
end
