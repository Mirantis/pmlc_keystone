# == Class: pmlc_keystone
#
# Class to setup and manage keystone
#
# === Authors
#
# Scott Brimhall <sbrimhall@mirantis.com>
#
# === Copyright
#
# Copyright 2015 Mirantis Inc, unless otherwise noted.
#
class pmlc_keystone (
  $debug                   = $::pmlc_keystone::params::debug,
  $use_ad                  = $::pmlc_keystone::params::use_ad,
  $rabbit_user             = $::pmlc_keystone::params::rabbit_user,
  $rabbit_pass             = $::pmlc_keystone::params::rabbit_pass,
  $database_user           = $::pmlc_keystone::params::database_user,
  $database_password       = $::pmlc_keystone::params::database_password,
  $notification_driver     = $::pmlc_keystone::params::notification_driver,
  $notification_topics     = $::pmlc_keystone::params::notification_topics,
  $public_workers          = $::pmlc_keystone::params::public_workers,
  $admin_workers           = $::pmlc_keystone::params::admin_workers,
  $memcache_dead_retry     = $::pmlc_keystone::params::memcache_dead_retry,
  $memcache_socket_timeout = $::pmlc_keystone::params::memcache_socket_timeout,
  $dead_retry              = $::pmlc_keystone::params::dead_retry,
  $socket_timeout          = $::pmlc_keystone::params::socket_timeout,
  $bind_user               = undef,
  $ldap_password           = undef,
  $suffix                  = $::pmlc_keystone::params::suffix,
  $query_scope             = $::pmlc_keystone::params::query_scope,
  $user_tree_dn            = $::pmlc_keystone::params::user_tree_dn,
  $user_objectclass        = $::pmlc_keystone::params::user_objectclass,
  $user_id_attribute       = $::pmlc_keystone::params::user_id_attribute,
  $user_name_attribute     = $::pmlc_keystone::params::user_name_attribute,
  $user_mail_attribute     = $::pmlc_keystone::params::user_mail_attribute,
  $user_enabled_attribute  = $::pmlc_keystone::params::user_enabled_attribute,
  $management_vip          = $::pmlc_keystone::params::management_vip,
) inherits ::pmlc_keystone::params {

  include stdlib

  # Validate parameters
  validate_bool($debug)
  validate_bool($use_ad)
  validate_string($rabbit_user)
  validate_string($rabbit_pass)
  validate_string($database_user)
  validate_string($database_password)
  validate_string($notification_driver)
  validate_string($notification_topics)
  validate_integer($public_workers)
  validate_integer($admin_workers)
  validate_integer($memcache_dead_retry)
  validate_integer($memcache_socket_timeout)
  validate_integer($dead_retry)
  validate_integer($socket_timeout)

  if $use_ad == true {
    validate_string($bind_user)
    validate_string($ldap_password)
    validate_string($suffix)
    validate_string($query_scope)
    validate_string($user_tree_dn)
    validate_string($user_objectclass)
    validate_string($user_id_attribute)
    validate_string($user_name_attribute)
    validate_string($user_mail_attribute)
    validate_string($user_enabled_attribute)
  }

  include ::pmlc_keystone::install
  include ::pmlc_keystone::config
  include ::pmlc_keystone::service

  # Order classes
  Class['::pmlc_keystone::install'] ->
  Class['::pmlc_keystone::config'] ->
  Class['::pmlc_keystone::service']

}
