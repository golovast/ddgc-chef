name             'ddgc-chef-new'
maintainer       'YOUR_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures ddgc-chef-new'
long_description 'Installs/Configures ddgc-chef-new'
version          '0.1.0'
depends "perlbrew", "~> 0.1.0"
depends "daemontools", "~> 1.3.0"
depends "nginx", "~> 2.7.4"
depends "sysctl"
depends "ddgc-chef-new"
depends "ephemeral_lvm"