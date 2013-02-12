class fscache::install {
  package { 'cachefilesd':
    ensure => present,
  }
}
