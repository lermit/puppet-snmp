# = Class: snmp
#
# This is the main snmp class
#
#
# == Parameters
#
# SNMP specific parameters
#
# [*community*]
#   Wanted SNMP community. ( Default : public ).
#   If you want to have many community/listen address use your own template.
#   See *template* option
#
# [*community_listen*]
#   Where to listen to. Default : 127.0.0.1
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, snmp class will automatically "include $my_class"
#   Can be defined also by the (top scope) variable $snmp_myclass
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, snmp main config file will have the param: source => $source
#   Can be defined also by the (top scope) variable $snmp_source
#
# [*source_dir*]
#   If defined, the whole snmp configuration directory content is retrieved
#   recursively from the specified source
#   (source => $source_dir , recurse => true)
#   Can be defined also by the (top scope) variable $snmp_source_dir
#
# [*source_dir_purge*]
#   If set to true (default false) the existing configuration directory is
#   mirrored with the content retrieved from source_dir
#   (source => $source_dir , recurse => true , purge => true)
#   Can be defined also by the (top scope) variable $snmp_source_dir_purge
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, snmp main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#   Can be defined also by the (top scope) variable $snmp_template
#
# [*options*]
#   An hash of custom options to be used in templates for arbitrary settings.
#   Can be defined also by the (top scope) variable $snmp_options
#
# [*service_autorestart*]
#   Automatically restarts the snmp service when there is a change in
#   configuration files. Default: true, Set to false if you don't want to
#   automatically restart the service.
#
# [*version*]
#   The package version, used in the ensure parameter of package type.
#   Default: present. Can be 'latest' or a specific version number.
#   Note that if the argument absent (see below) is set to true, the
#   package is removed, whatever the value of version parameter.
#
# [*absent*]
#   Set to 'true' to remove package(s) installed by module
#   Can be defined also by the (top scope) variable $snmp_absent
#
# [*disable*]
#   Set to 'true' to disable service(s) managed by module
#   Can be defined also by the (top scope) variable $snmp_disable
#
# [*disableboot*]
#   Set to 'true' to disable service(s) at boot, without checks if it's running
#   Use this when the service is managed by a tool like a cluster software
#   Can be defined also by the (top scope) variable $snmp_disableboot
#
# [*monitor*]
#   Set to 'true' to enable monitoring of the services provided by the module
#   Can be defined also by the (top scope) variables $snmp_monitor
#   and $monitor
#
# [*monitor_tool*]
#   Define which monitor tools (ad defined in Example42 monitor module)
#   you want to use for snmp checks
#   Can be defined also by the (top scope) variables $snmp_monitor_tool
#   and $monitor_tool
#
# [*monitor_target*]
#   The Ip address or hostname to use as a target for monitoring tools.
#   Default is the fact $ipaddress
#   Can be defined also by the (top scope) variables $snmp_monitor_target
#   and $monitor_target
#
# [*puppi*]
#   Set to 'true' to enable creation of module data files that are used by puppi
#   Can be defined also by the (top scope) variables $snmp_puppi and $puppi
#
# [*puppi_helper*]
#   Specify the helper to use for puppi commands. The default for this module
#   is specified in params.pp and is generally a good choice.
#   You can customize the output of puppi commands for this module using another
#   puppi helper. Use the define puppi::helper to create a new custom helper
#   Can be defined also by the (top scope) variables $snmp_puppi_helper
#   and $puppi_helper
#
# [*firewall*]
#   Set to 'true' to enable firewalling of the services provided by the module
#   Can be defined also by the (top scope) variables $snmp_firewall
#   and $firewall
#
# [*firewall_tool*]
#   Define which firewall tool(s) (ad defined in Example42 firewall module)
#   you want to use to open firewall for snmp port(s)
#   Can be defined also by the (top scope) variables $snmp_firewall_tool
#   and $firewall_tool
#
# [*firewall_src*]
#   Define which source ip/net allow for firewalling snmp. Default: 0.0.0.0/0
#   Can be defined also by the (top scope) variables $snmp_firewall_src
#   and $firewall_src
#
# [*firewall_dst*]
#   Define which destination ip to use for firewalling. Default: $ipaddress
#   Can be defined also by the (top scope) variables $snmp_firewall_dst
#   and $firewall_dst
#
# [*debug*]
#   Set to 'true' to enable modules debugging
#   Can be defined also by the (top scope) variables $snmp_debug and $debug
#
# [*audit_only*]
#   Set to 'true' if you don't intend to override existing configuration files
#   and want to audit the difference between existing files and the ones
#   managed by Puppet.
#   Can be defined also by the (top scope) variables $snmp_audit_only
#   and $audit_only
#
# Default class params - As defined in snmp::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of snmp package
#
# [*service*]
#   The name of snmp service
#
# [*service_status*]
#   If the snmp service init script supports status argument
#
# [*process*]
#   The name of snmp process
#
# [*process_args*]
#   The name of snmp arguments. Used by puppi and monitor.
#   Used only in case the snmp process name is generic (java, ruby...)
#
# [*process_user*]
#   The name of the user snmp runs with. Used by puppi and monitor.
#
# [*config_dir*]
#   Main configuration directory. Used by puppi
#
# [*config_file*]
#   Main configuration file path
#
# [*config_file_mode*]
#   Main configuration file path mode
#
# [*config_file_owner*]
#   Main configuration file path owner
#
# [*config_file_group*]
#   Main configuration file path group
#
# [*config_file_init*]
#   Path of configuration file sourced by init script
#
# [*pid_file*]
#   Path of pid file. Used by monitor
#
# [*data_dir*]
#   Path of application data directory. Used by puppi
#
# [*log_dir*]
#   Base logs directory. Used by puppi
#
# [*log_file*]
#   Log file(s). Used by puppi
#
# [*port*]
#   The listening port, if any, of the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Note: This doesn't necessarily affect the service configuration file
#   Can be defined also by the (top scope) variable $snmp_port
#
# [*protocol*]
#   The protocol used by the the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Can be defined also by the (top scope) variable $snmp_protocol
#
#
# == Examples
#
# You can use this class in 2 ways:
# - Set variables (at top scope level on in a ENC) and "include snmp"
# - Call snmp as a parametrized class
#
# See README for details.
#
#
# == Author
#   Romain THERRAT <romain42@gmail.com/>
#
class snmp (
  $community           = params_lookup( 'community' ),
  $community_listen    = params_lookup( 'community_listen' ),
  $my_class            = params_lookup( 'my_class' ),
  $source              = params_lookup( 'source' ),
  $source_dir          = params_lookup( 'source_dir' ),
  $source_dir_purge    = params_lookup( 'source_dir_purge' ),
  $template            = params_lookup( 'template' ),
  $service_autorestart = params_lookup( 'service_autorestart' , 'global' ),
  $options             = params_lookup( 'options' ),
  $version             = params_lookup( 'version' ),
  $absent              = params_lookup( 'absent' ),
  $disable             = params_lookup( 'disable' ),
  $disableboot         = params_lookup( 'disableboot' ),
  $monitor             = params_lookup( 'monitor' , 'global' ),
  $monitor_tool        = params_lookup( 'monitor_tool' , 'global' ),
  $monitor_target      = params_lookup( 'monitor_target' , 'global' ),
  $puppi               = params_lookup( 'puppi' , 'global' ),
  $puppi_helper        = params_lookup( 'puppi_helper' , 'global' ),
  $firewall            = params_lookup( 'firewall' , 'global' ),
  $firewall_tool       = params_lookup( 'firewall_tool' , 'global' ),
  $firewall_src        = params_lookup( 'firewall_src' , 'global' ),
  $firewall_dst        = params_lookup( 'firewall_dst' , 'global' ),
  $debug               = params_lookup( 'debug' , 'global' ),
  $audit_only          = params_lookup( 'audit_only' , 'global' ),
  $package             = params_lookup( 'package' ),
  $service             = params_lookup( 'service' ),
  $service_status      = params_lookup( 'service_status' ),
  $process             = params_lookup( 'process' ),
  $process_args        = params_lookup( 'process_args' ),
  $process_user        = params_lookup( 'process_user' ),
  $config_dir          = params_lookup( 'config_dir' ),
  $config_file         = params_lookup( 'config_file' ),
  $config_file_mode    = params_lookup( 'config_file_mode' ),
  $config_file_owner   = params_lookup( 'config_file_owner' ),
  $config_file_group   = params_lookup( 'config_file_group' ),
  $config_file_init    = params_lookup( 'config_file_init' ),
  $pid_file            = params_lookup( 'pid_file' ),
  $data_dir            = params_lookup( 'data_dir' ),
  $log_dir             = params_lookup( 'log_dir' ),
  $log_file            = params_lookup( 'log_file' ),
  $port                = params_lookup( 'port' ),
  $protocol            = params_lookup( 'protocol' )
  ) inherits snmp::params {

  $bool_source_dir_purge=any2bool($source_dir_purge)
  $bool_service_autorestart=any2bool($service_autorestart)
  $bool_absent=any2bool($absent)
  $bool_disable=any2bool($disable)
  $bool_disableboot=any2bool($disableboot)
  $bool_monitor=any2bool($monitor)
  $bool_puppi=any2bool($puppi)
  $bool_firewall=any2bool($firewall)
  $bool_debug=any2bool($debug)
  $bool_audit_only=any2bool($audit_only)

  ### Definition of some variables used in the module
  $manage_package = $snmp::bool_absent ? {
    true  => 'absent',
    false => $snmp::version,
  }

  $manage_service_enable = $snmp::bool_disableboot ? {
    true    => false,
    default => $snmp::bool_disable ? {
      true    => false,
      default => $snmp::bool_absent ? {
        true  => false,
        false => true,
      },
    },
  }

  $manage_service_ensure = $snmp::bool_disable ? {
    true    => 'stopped',
    default =>  $snmp::bool_absent ? {
      true    => 'stopped',
      default => 'running',
    },
  }

  $manage_service_autorestart = $snmp::bool_service_autorestart ? {
    true    => Service[snmp],
    false   => undef,
  }

  $manage_file = $snmp::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  if $snmp::bool_absent == true
  or $snmp::bool_disable == true
  or $snmp::bool_disableboot == true {
    $manage_monitor = false
  } else {
    $manage_monitor = true
  }

  if $snmp::bool_absent == true
  or $snmp::bool_disable == true {
    $manage_firewall = false
  } else {
    $manage_firewall = true
  }

  $manage_audit = $snmp::bool_audit_only ? {
    true  => 'all',
    false => undef,
  }

  $manage_file_replace = $snmp::bool_audit_only ? {
    true  => false,
    false => true,
  }

  $manage_file_source = $snmp::source ? {
    ''        => undef,
    default   => $snmp::source,
  }

  $manage_file_content = $snmp::template ? {
    ''        => undef,
    default   => template($snmp::template),
  }

  ### Managed resources
  package { 'snmp':
    ensure => $snmp::manage_package,
    name   => $snmp::package,
  }

  service { 'snmp':
    ensure     => $snmp::manage_service_ensure,
    name       => $snmp::service,
    enable     => $snmp::manage_service_enable,
    hasstatus  => $snmp::service_status,
    pattern    => $snmp::process,
    require    => Package['snmp'],
  }

  file { 'snmp.conf':
    ensure  => $snmp::manage_file,
    path    => $snmp::config_file,
    mode    => $snmp::config_file_mode,
    owner   => $snmp::config_file_owner,
    group   => $snmp::config_file_group,
    require => Package['snmp'],
    notify  => $snmp::manage_service_autorestart,
    source  => $snmp::manage_file_source,
    content => $snmp::manage_file_content,
    replace => $snmp::manage_file_replace,
    audit   => $snmp::manage_audit,
  }

  # The whole snmp configuration directory can be recursively overriden
  if $snmp::source_dir {
    file { 'snmp.dir':
      ensure  => directory,
      path    => $snmp::config_dir,
      require => Package['snmp'],
      notify  => $snmp::manage_service_autorestart,
      source  => $snmp::source_dir,
      recurse => true,
      purge   => $snmp::source_dir_purge,
      replace => $snmp::manage_file_replace,
      audit   => $snmp::manage_audit,
    }
  }


  ### Include custom class if $my_class is set
  if $snmp::my_class {
    include $snmp::my_class
  }


  ### Provide puppi data, if enabled ( puppi => true )
  if $snmp::bool_puppi == true {
    $classvars=get_class_args()
    puppi::ze { 'snmp':
      ensure    => $snmp::manage_file,
      variables => $classvars,
      helper    => $snmp::puppi_helper,
    }
  }


  ### Service monitoring, if enabled ( monitor => true )
  if $snmp::bool_monitor == true {
    if $snmp::protocol == 'tcp' {
      monitor::port { "snmp_${snmp::protocol}_${snmp::port}":
        protocol => $snmp::protocol,
        port     => $snmp::port,
        target   => $snmp::monitor_target,
        tool     => $snmp::monitor_tool,
        enable   => $snmp::manage_monitor,
      }
    }
    monitor::process { 'snmp_process':
      process  => $snmp::process,
      service  => $snmp::service,
      pidfile  => $snmp::pid_file,
      user     => $snmp::process_user,
      argument => $snmp::process_args,
      tool     => $snmp::monitor_tool,
      enable   => $snmp::manage_monitor,
    }
  }


  ### Firewall management, if enabled ( firewall => true )
  if $snmp::bool_firewall == true {
    firewall { "snmp_${snmp::protocol}_${snmp::port}":
      source      => $snmp::firewall_src,
      destination => $snmp::firewall_dst,
      protocol    => $snmp::protocol,
      port        => $snmp::port,
      action      => 'allow',
      direction   => 'input',
      tool        => $snmp::firewall_tool,
      enable      => $snmp::manage_firewall,
    }
  }


  ### Debugging, if enabled ( debug => true )
  if $snmp::bool_debug == true {
    file { 'debug_snmp':
      ensure  => $snmp::manage_file,
      path    => "${settings::vardir}/debug-snmp",
      mode    => '0640',
      owner   => 'root',
      group   => 'root',
      content => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime.*|path|timestamp|free|.*password.*|.*psk.*|.*key)/ }.to_yaml %>'),
    }
  }

}
