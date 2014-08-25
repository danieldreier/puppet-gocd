# == Class: puppet::package::repository
#
# Add Puppet Labs package repositories
#
# == Parameters
#
# [*devel*]
#   Include development repositories for bleeding edge releases.
#   Default: false
#
# == Requirements
#
# If used on apt based distributions, this requires the puppetlabs/apt module.
#
class gocd::install::repository::apt {
  include gocd
  apt::source { 'gocd-deb-bintray':
    ensure      => $::gocd::ensure,
    location    => $::gocd::params::repo_url,
    repos       => '/',
    release     => '',
    include_src => false,
  }
}
