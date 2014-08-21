# encoding: UTF-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

source 'https://rubygems.org'

group :test do
  gem 'rake'
  gem 'berkshelf', '~> 2.0'
end

group :style do
  gem 'foodcritic', '~> 4.0'
  gem 'rubocop', '~> 0.24'
end

group :unit do
  gem 'chefspec', '~> 4.0'
  gem 'chef-encrypted-attributes'
end

group :integration do
  gem 'vagrant', github: 'mitchellh/vagrant'
  gem 'test-kitchen', '~> 1.2'
  gem 'kitchen-vagrant', '~> 0.10'
end
