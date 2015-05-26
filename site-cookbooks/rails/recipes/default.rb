#
# Cookbook Name:: rails
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

bash "install rails" do
  code <<-EOS
    gem install rails
  EOS
  not_if File.exists?("/home/vagrant/.rbenv/versions/2.1.3/bin/rails")
end



# bundle
# unicorn -c /vagrant/www/apps/config/unicorn.rb -D
