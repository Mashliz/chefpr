#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory "/vagrant/www" do
  owner "vagrant"
  group "vagrant"
  mode  0711
  action :create
end

package "nginx" do
  action :install
end

service "nginx" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

template "/etc/nginx/nginx.conf" do
  owner "root"
  group "root"
  mode 0644
  notifies :reload, "service[nginx]"
end