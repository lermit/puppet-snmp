# Define: snmp::extend
#
# Add an extend line into snmp configuration file
#
# Usage:
#  snmp::extend { "name":
#      command     => '/command/to/run'
#      extend_name => 'my extend name',
#  }
#
# For example, to add an extend named 'postfix_mailqueue' that
# launch  '/usr/lib/nagios/plugins/check_postfix_mailqueue'.
#
#   snmp::extend { "postfix_mailqueue":
#       command => '/usr/lib/nagios/plugins/check_postfix_mailqueue',
#   }
#
# This will add to /etc/snmp/snmpd.conf
#
#   extend postfix_mailqueue /usr/lib/nagios/plugins/check_postfix_mailqueue
#
# If extend_name is not set he will take snmp::extend name as value.
#
define snmp::extend(
  $command,
  $extend_name = $name ) {

  include snmp

  # Create repository file
  exec { "add_extend_${extend_name}":
    command => "echo 'extend ${extend_name} ${command}'>>${snmp::params::config_file}",
    path    => '/usr/bin:/bin:/usr/sbin:/sbin',
    onlyif  => "grep extend ${snmp::params::config_file} |grep -v '^#' |grep '${extend_name}' |grep '${command}'",
  }
}
