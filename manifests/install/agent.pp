class gocd::install::agent {
  include ::gocd::install
  class { 'gocd::install::package':
    package => $::gocd::params::agent_package
  }
}
