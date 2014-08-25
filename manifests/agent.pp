# == Class: puppet::agent
#
# Install, configure, and run a puppet agent instance.
#
# == Parameters
#
# [*server*]
#   The puppet server to use for fetching catalogs. Required.
# [*ca_server*]
#   The puppet server to use for certificate requests and similar actions.
#   Default: puppet::agent::server
# [*report_server*]
#   The puppet server to send reports.
#   Default: puppet::agent::server
# [*manage_repos*]
#   Whether to manage Puppet Labs APT or YUM package repos.
#   Default: true
# [*method*]
#   The mechanism for performing puppet runs.
#   Supported methods: [cron, service]
#   Default: cron
# [*environment*]
#   What environment the agent should be part of.
#   Default: $::environment
#
# == Example:
#
#   class { 'puppet::agent':
#     server        => 'puppet.example.com',
#     report_server => 'puppet_reports.example.com',
#     method        => 'service',
#  }
#
class gocd::agent (
  $ensure         = $::gocd::ensure,
  $service        = $::gocd::service,
  $go_server      = 'auto',
  $manage_package = true,
  $manage_service = true,
) {
  include gocd

  if $manage_package {
    include gocd::install::agent
  }

  if $go_server == 'auto' {
    # use exported resources to find server
  } else {
    # use the server specified
  }

  if $ensure == 'present' {
    include gocd::agent::config
  }

  if $manage_service {
    include gocd::agent::service
  }
}
