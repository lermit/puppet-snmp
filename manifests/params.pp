# Class: snmp::params
#
# This class defines default parameters used by the main module class snmp
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to snmp class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class snmp::params {

  ### Specific snmp parameters
  $community = 'public'
  $community_listen = '127.0.0.1'

  ### Application related parameters

  $package = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => 'snmpd',
    default                   => 'snmpd',
  }

  $service = $::operatingsystem ? {
    default => 'snmpd',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'snmpd',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    default => 'snmp',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/snmp',
  }

  $config_file = $::operatingsystem ? {
    default => '/etc/snmp/snmpd.conf',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0600',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/snmpd',
    default                   => '/etc/sysconfig/snmp',
  }

  $pid_file = $::operatingsystem ? {
    default => '/var/run/snmpd.pid',
  }

  $data_dir = $::operatingsystem ? {
    default => '/etc/snmp',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log/snmp',
  }

  $log_file = $::operatingsystem ? {
    default => '/var/log/snmp/snmp.log',
  }

  $port = '161'
  $protocol = 'udp'

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = 'snmp/snmpd.conf.erb'
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false

}
