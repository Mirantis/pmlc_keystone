# == Class: pmlc_keystone::service
#
# Class to configure keystone services on controller
#
# === Authors
#
# Scott Brimhall <sbrimhall@mirantis.com>
#
# === Copyright
#
# Copyright 2015 Mirantis Inc, unless otherwise noted.
#
class pmlc_keystone::service (
  $debug                   = $::pmlc_keystone::debug,
  $use_ad                  = $::pmlc_keystone::use_ad,
  $rabbit_user             = $::pmlc_keystone::rabbit_user,
  $rabbit_pass             = $::pmlc_keystone::rabbit_pass,
  $database_user           = $::pmlc_keystone::database_user,
  $database_password       = $::pmlc_keystone::database_password,
  $notification_driver     = $::pmlc_keystone::notification_driver,
  $notification_topics     = $::pmlc_keystone::notification_topics,
  $public_workers          = $::pmlc_keystone::public_workers,
  $admin_workers           = $::pmlc_keystone::admin_workers,
  $memcache_dead_retry     = $::pmlc_keystone::memcache_dead_retry,
  $memcache_socket_timeout = $::pmlc_keystone::memcache_socket_timeout,
  $dead_retry              = $::pmlc_keystone::dead_retry,
  $socket_timeout          = $::pmlc_keystone::socket_timeout,
  $bind_user               = $::pmlc_keystone::bind_user,
  $ldap_password           = $::pmlc_keystone::ldap_password,
  $suffix                  = $::pmlc_keystone::suffix,
  $query_scope             = $::pmlc_keystone::query_scope,
  $user_tree_dn            = $::pmlc_keystone::user_tree_dn,
  $user_objectclass        = $::pmlc_keystone::user_objectclass,
  $user_id_attribute       = $::pmlc_keystone::user_id_attribute,
  $user_name_attribute     = $::pmlc_keystone::user_name_attribute,
  $user_mail_attribute     = $::pmlc_keystone::user_mail_attribute,
  $user_enabled_attribute  = $::pmlc_keystone::user_enabled_attribute,
) inherits ::pmlc_keystone {

  $service = 'keystone'

  service { $service:
    ensure    => 'running',
    enable    => true,
    require   => File['keystone_conf'],
    subscribe => File['keystone_conf'],
  }

}
