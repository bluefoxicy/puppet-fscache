class fscache(
  $dir                  = $fscache::params::dir,
  $brun                 = $fscache::params::brun,
  $bcull                = $fscache::params::bcull,
  $bstop                = $fscache::params::bstop,
  $frun                 = $fscache::params::frun,
  $fcull                = $fscache::params::fcull,
  $fstop                = $fscache::params::fstop,
  $culltable            = $fscache::params::culltable,
) inherits fscache::params {
  if ( !
    (          0 <= $bstop
      and $bstop <  $bcull
      and $bcull <  $brun
      and $brun  <  100)
  ) {
    fail('fscache error:  require 0 <= bstop < bcull < brun < 100')
  }
  if ( !
    (          0 <= $fstop
      and $fstop <  $fcull
      and $fcull <  $frun
      and $frun  <  100)
  ) {
    fail('fscache error:  require 0 <= fstop < fcull < frun < 100')
  }

  if ( !( $culltable >= 12 and $culltable <= 20) ) {
    fail('fscache error:  require 12 <= culltable <= 20')
  }

  include fscache::install
  include fscache::config
  include fscache::service
}
