#
# Cookbook Name:: init
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{ /home/vagrant/.bash_profile /home/vagrant/.vimrc }.each do |tmp|
  template tmp do
    owner "vagrant"
    group "vagrant"
    mode 0644
  end
end