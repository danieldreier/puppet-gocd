source "http://rubygems.org"

group :test do
  gem "rake"
  gem "puppet", ENV['PUPPET_VERSION'] || '~> 3.6.1'
  gem "puppet-lint"
  gem "rspec-puppet", :git => 'https://github.com/rodjek/rspec-puppet.git'
  gem "rspec", '< 3.0.0'
  gem "puppet-syntax"
  gem "puppetlabs_spec_helper"

  # test kitchen related
  gem "test-kitchen"
  gem "kitchen-puppet"
  gem 'kitchen-vagrant'
  gem "librarian-puppet"
  #gem "r10k"
  gem 'kitchen-sync'
  gem 'kitchen-ec2'
end

group :development do
  gem "travis"
  gem "travis-lint"
  gem "beaker"
  gem "beaker-rspec"
  gem "vagrant-wrapper"
  gem "puppet-blacksmith"
  gem "guard-rake"
end
