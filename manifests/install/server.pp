class gocd::install::server {
  include ::gocd::install
  class { 'gocd::install::package':
    package => $::gocd::params::server_package
  }
}
