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
  $ensure         = 'present',
  $service        = 'running',
  $go_server      = 'auto',
) {
  include gocd

  include gocd::install::agent

  if $go_server == 'auto' {
    # use exported resources to find server
  } else {
    # use the server specified
  }

  include gocd::agent::config

  class { 'gocd::agent::service':
    ensure => $service,
  }
}
