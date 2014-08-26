class gocd::server::config {
  # Set server address for clients
  @@augeas { "go_cd_agent_config_GO_SERVER_${::fqdn}":
    lens    => 'Shellvars.lns',
    incl    => $gocd::params::agent_service_config,
    changes => [
      "set GO_SERVER ${::fqdn}"
    ],
    tag     => 'go_agent_config_server_fqdn';
  }

  alert('configure server here')
}
