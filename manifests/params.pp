# Params class for Keystone module
class pmlc_keystone::params {

  $debug                   = false
  $rabbit_user             = 'rabbit'
  $rabbit_pass             = 'rabbit'
  $database_user           = 'keystone'
  $database_password       = 'keystone'
  $management_vip          = undef
  $notification_driver     = 'messaging'
  $notification_topics     = 'notifications'
  $public_workers          = 20
  $admin_workers           = 20
  $memcache_dead_retry     = 100
  $memcache_socket_timeout = 1
  $dead_retry              = 100
  $socket_timeout          = 1
  $use_ad                  = false
  $bind_user               = 'cn=Administrator,dc=com'
  $ldap_password           = 'newpassword'
  $suffix                  = 'dc=com'
  $query_scope             = 'sub'
  $user_tree_dn            = 'dc=com'
  $user_objectclass        = 'person'
  $user_id_attribute       = 'samaccountname'
  $user_name_attribute     = 'samaccountname'
  $user_mail_attribute     = 'samaccountname'
  $user_enabled_attribute  = 'samaccountname'
}
