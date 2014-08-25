# Class:go::service
#
# Abstraction for managing enabling and disabling the Go CD server
# and agent services
#
define gocd::service (
  $ensure       = 'running',
  $role         = $title,
  $service_name = "go-${title}"
) {
  include gocd::params

  case $ensure {
    'latest', true, 'running', 'present': { $service = 'running' }
    'absent':  { $service = 'absent' }
    'stopped': { $service = 'stopped' }
    default: { $service = 'running' }
  }

  service { $service_name:
    ensure     => $service,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => [ Class["gocd::${role}::config"],
                    Class["gocd::install::${role}"] ],
  }
}
