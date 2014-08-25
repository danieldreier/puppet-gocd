class gocd::install {
  include ::gocd
  if $gocd::manage_repos { include $::gocd::params::repo_class }
}
