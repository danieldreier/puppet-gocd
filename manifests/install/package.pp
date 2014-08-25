class gocd::install::package (
  $package = $::gocd::params::agent_package
){
  include ::gocd::install

  package { $package:
    ensure          => $::gocd::ensure,
    install_options => $::gocd::params::install_options,
  }
}
