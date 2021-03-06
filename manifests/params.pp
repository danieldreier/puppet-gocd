# Default puppet data
class gocd::params (
  $agent_package        = 'go-agent',
  $server_package       = 'go-server',
  $agent_service        = 'go-agent',
  $server_service       = 'go-server',
  $agent_service_config = '/etc/default/go-agent',
) {
  case $::operatingsystem {
    'debian', 'ubuntu': {
      $repo_url        = 'http://dl.bintray.com/gocd/gocd-deb/'
      $install_options = [ '--force-yes' ]
      $repo_class      = gocd::install::repository::apt
    }
    'CentOS', 'RedHat', 'fedora', 'sles', 'opensuse', 'OracleLinux': {
      $repo_url   = 'http://dl.bintray.com/gocd/gocd-rpm'
      $repo_class = gocd::install::repository::yum
    }
    default: { fail("Sorry, ${::operatingsystem} is not supported") }
  }
}
