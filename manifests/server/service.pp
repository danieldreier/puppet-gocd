# Class:go::server::service
#
# Manages enabling and disabling the Go CD server service
#
class gocd::server::service (
  $ensure = 'running'
) {
  include gocd::params

  case $ensure {
    'latest', true, 'running', 'present': { $service = 'running' }
    'absent':  { $service = 'absent' }
    'stopped': { $service = 'stopped' }
    default: { $service = 'running' }
  }

  service { $gocd::params::server_service:
    ensure     => $service,
    name       => $gocd::params::server_service,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
