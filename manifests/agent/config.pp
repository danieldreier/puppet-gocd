class gocd::agent::config (
  $go_server = 'auto'
){
  # set localhost if this is also a go server
  # for an all-in-one installation (not recommended)
  if defined( 'gocd::server' ) {
    $go_server = '127.0.0.1'
  }

  if $go_server == 'auto' {
    # use exported resources to find server
    # get the Go server's FQDN from exported resources
    Augeas <<| tag == 'go_agent_config_server_fqdn' |>>
  } else {
    # use the server specified
    augeas { 'go_cd_agent_config_GO_SERVER':
      lens    => 'Shellvars.lns',
      incl    => $gocd::params::agent_service_config,
      changes => [
        "set GO_SERVER ${::fqdn}"
      ],
    }
  }
}
