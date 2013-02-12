puppet-fscache
==============

A module to configure NFS cachefilesd.

This module enables fscache for use with NFS.  Essentially, fscache
stores cached bits of files from remote file systems like NFS or AFS,
improving access and decreasing network traffic.  Works with GlusterFS
over NFS as well.


```puppet
node 'web-1.example.com' {
  include fscache
}
```

This module includes sane defaults; however it has tuneables you may
set via Hiera.
