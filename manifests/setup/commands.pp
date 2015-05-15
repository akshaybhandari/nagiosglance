class nagiosglance::setup::commands (
  $service_list = ['openvswitch-switch', 'nova-compute', 'libvirt-bin'],
  $os_type = linux,
) {
  case $::osfamily {
    'redhat': {
      $plugin_dir = '/usr/lib64/nagios/plugins'
      $nrpe_cfgdir = '/etc/nrpe.d'
    }
    'debian': {
      $plugin_dir = '/usr/lib/nagios/plugins'
      $nrpe_cfgdir = '/etc/nagios/nrpe.d'
    }
    default: { fail("No such osfamily: ${::osfamily} yet defined") }
  }

  #OpenStack related checks
  each($service_list) |$service| {
    file_line { "check_service_${service}_${hostname}":
      ensure  => present,
      path    => "${nrpe_cfgdir}/nrpe_command.cfg",
      line    => "command[check_service_${service}]=${plugin_dir}/check_service.sh -o ${os_type} -s ${service}",
      require => File["${nrpe_cfgdir}/nrpe_command.cfg"],
      notify  => Service['nagios-nrpe-server'],
    }
  }
}
