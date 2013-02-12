class fscache::service {
  service { 'cachefilesd':
    ensure => running,
    enable => true,
  }

  File <| tag == 'cachefilesd' |> ->
  Service['cachefilesd']
}
