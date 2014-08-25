# Class:go::server::service
#
# Manages enabling and disabling the Go CD server service
#
class gocd::server::service (
  $ensure = 'running'
) {
  include gocd::params

  gocd::service { 'server':
    ensure       => $ensure,
    role         => 'server',
    service_name => $gocd::params::server_service,
  }
}
