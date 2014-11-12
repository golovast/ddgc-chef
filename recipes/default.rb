
# Cookbook Name:: ddgc-chef-new
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "nginx"
include_recipe "perlbrew"
include_recipe "nginx"
include_recipe "sysctl"
include_recipe "daemontools"
include_recipe "ephemeral_lvm"

%w{
  build-essential
  libgd2-xpm-dev
  libssl-dev
  git
  wget
  libxml2-dev
  imagemagick 
  perl-doc 
  postgresql 
  libpq-dev
}.each do |pkg|
  apt_package pkg do
    action :install
  end
end

user "ddgc" do
	home "/home/ddgc"
	shell "/bin/bash"
end

template "#{node[:nginx][:dir]}/sites-available/ddgc.conf" do
	source "ddgc.conf.erb"
	owner 'root'
	group 'root'
	mode '0644'
end

nginx_site "ddgc.conf" do
	enable true
	notifies :reload, 'service[nginx]'
end

daemontools_service "nginx_svc" do
	directory "/etc/service/nginx"
	template "nginx"
	action [:enable,:start]
end

daemontools_service "dezi_server" do
	directory "/etc/service/dezi"
	template "dezi"
	action [:enable,:start]
end

daemontools_service "ddc_web" do
	directory "/etc/service/ddc"
	template "ddc"
	action [:enable,:start]
end

perlbrew_lib 'perl-5.16.3@mylib' do
  action :create
end

perlbrew_cpanm 'Dependencies' do
	perlbrew 'perl-5.16.3@mylib'
	modules node[:perlbrew][:modules]
end
