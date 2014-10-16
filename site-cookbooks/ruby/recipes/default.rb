#
# Cookbook Name:: ruby
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


# package "ruby" do
#  action :install
# end


package "ruby-devel" do
  action :install
end

directory "/home/vagrant/.rbenv" do
  owner "vagrant"
  group "vagrant"
  mode 0711
  action :create
end

git "/home/vagrant/.rbenv" do
  repository "git://github.com/sstephenson/rbenv.git"
  reference "master"
  action :checkout
  user "vagrant"
  group "vagrant"
end

%w{ /home/vagrant/.rbenv/plugins/ /home/vagrant/.rbenv/plugins/ruby-build }.each do |dir|
  directory dir do
    owner "vagrant"
    group "vagrant"
    mode 0711
    action :create
  end
end

git "/home/vagrant/.rbenv/plugins/ruby-build" do
  repository "git://github.com/sstephenson/ruby-build.git"
  reference "master"
  action :checkout
  user "vagrant"
  group "vagrant"
end

bash "init rbenv" do
  code <<-EOS
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/vagrant/.bash_profile
    echo 'eval "$(rbenv init -)"' >> /home/vagrant/.bash_profile
    exec $SHELL -l
    /home/vagrant/.rbenv/plugins/ruby-build/install.sh
    sed -i -e "s/Defaults    env_reset/#Defaults    env_reset/" /etc/sudoers
    rbenv install 2.1.3
    rbenv global 2.1.3    
  EOS
  not_if "grep 'rbenv' /home/vagrant/.bash_profile"
end

