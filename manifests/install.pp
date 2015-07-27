# == Class: pmlc_keystone::install
#
# Install keystone packages
#
# Scott Brimhall [sbrimhall@mirantis.com]
#
# === Copyright
#
# Copyright 2015 Mirantis Inc, unless otherwise noted.
#
class pmlc_keystone::install {

  $packages = [
    'keystone',
    'python-keystone',
    'python-keystoneclient',
    'python-keystonemiddleware',
  ]

  package { $packages:
    ensure => 'present',
  }

}
