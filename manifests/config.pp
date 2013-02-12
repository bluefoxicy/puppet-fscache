class fscache::config {
  $dir                  = $::fscache::dir
  $brun                 = $::fscache::brun
  $bcull                = $::fscache::bcull
  $bstop                = $::fscache::bstop
  $frun                 = $::fscache::frun
  $fcull                = $::fscache::fcull
  $fstop                = $::fscache::fstop
  $culltable            = $::fscache::culltable

  file { "fscache $dir":
    ensure  => directory,
    path    => $dir,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    tag     => 'cachefilesd',
  }

  file { '/etc/cachefilesd.conf':
    ensure  => present,
    content => template('fscache/cachefilesd.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0444',
    tag     => 'cachefilesd',
  }

  Package['cachefilesd']          ->
  File <| tag == 'cachefilesd' |>
}
