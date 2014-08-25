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
class gocd::install::repository::yum {
  include gocd
  yumrepo { 'gocd-rpm':
    ensure   => $::gocd::ensure,
    baseurl  => $::gocd::params::repo_url,
    enabled  => 1,
    gpgcheck => 0,
  }
}
