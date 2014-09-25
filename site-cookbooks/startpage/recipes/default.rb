#
# Cookbook Name:: startpage
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

user "admin" do
  shell "/bin/bash"
  home "/home/admin"
  password nil
  supports :manage_home => true
end

group "wheel" do
  action :modify
  members ['admin']
  append true
end

%w{/home/admin/www}.each do |dir|
  directory dir do
    owner "root"
    group "root"
    mode 0644
    action :create
  end
end

template "/home/admin/www/index.html" do
  owner "root"
  group "root"
  mode 0644
end