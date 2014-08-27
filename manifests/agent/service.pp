# Class:go::agent::service
#
# Manages enabling and disabling the Go CD agent service
#
class gocd::agent::service (
  $ensure = 'running'
) {
  include gocd::params

  case $ensure {
    'latest', true, 'running', 'present': { $service = 'running' }
    'absent':  { $service = 'absent' }
    'stopped': { $service = 'stopped' }
    default: { $service = 'running' }
  }

  service { 'go-agent':
    ensure     => $service,
    name       => 'go-agent',
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => [ Class['gocd::agent::config'],
                    Class['gocd::install::agent'],
                    Package['go-agent'] ],
  }
}
