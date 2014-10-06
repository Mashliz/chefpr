#
# Cookbook Name:: ruby
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


#package "ruby" do
#  action :install
#end


%w{ /home/vagrant/.rbenv /home/vagrant/.rbenv/plugins/ /home/vagrant/.rbenv/plugins/ruby-build }.each do |dir|
  directory dir do
    owner "vagrant"
    group "vagrant"
    mode 0711
    action :create
  end
end

git "/home/vagrant/.rbenv" do
  repository "git://github.com/sstephenson/rbenv.git"
  reference "master"
  action :checkout
  user "vagrant"
  group "vagrant"
end

git "/home/vagrant/.rbenv/plugins/ruby-build" do
  repository "git://github.com/sstephenson/ruby-build.git"
  reference "master"
  action :checkout
  user "vagrant"
  group "vagrant"
end


# echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
# echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
# exec $SHELL -l

# cd ~/.rbenv/plugins/ruby-build/
# sudo ./install.sh


