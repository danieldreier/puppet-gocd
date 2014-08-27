require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.path = '/sbin:/usr/sbin'
  end
end

describe package('go-server') do
  it { should be_installed }
end

describe service('go-server') do
  it { should be_running }
end

describe package('go-agent') do
  it { should be_installed }
end

describe service('go-agent') do
  it { should be_running }
end
