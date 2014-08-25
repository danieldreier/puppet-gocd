# == Class: gocd
#
# == Description
#
# This manifest provides for shared behavior and resources between the agent
# and master.
#
# This module should not be directly included.
#
class gocd (
  $ensure       = 'present',
  $service      = 'running',
  $manage_repos = true,
) {
  include gocd::params

  # remove services on uninstall
  if $ensure == 'absent' {
    $service = $ensure
  }
}
