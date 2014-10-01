#
# Cookbook Name:: startpage
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{/home/admin /home/admin/www}.each do |dir|
  directory dir do
    owner "admin"
    group "wheel"
    mode 00771
    action :create
  end
end

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

template "/home/admin/www/index.html" do
  owner "admin"
  group "wheel"
  mode 00664
end