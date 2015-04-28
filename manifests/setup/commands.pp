class nagiosglance::setup::commands (
  $service_list = ['openvswitch-switch', 'nova-compute', 'libvirt-bin'],
  $os_type = linux,
) {
  #OpenStack related checks
  each($service_list) |$service| {
    file_line { "check_service_${service}_${hostname}":
      ensure  => present,
      path    => '/etc/nagios/nrpe.d/nrpe_command.cfg',
      line    => "command[check_service_${service}]=/usr/lib/nagios/plugins/check_service.sh -o ${os_type} -s ${service}",
      require => File['/etc/nagios/nrpe.d/nrpe_command.cfg'],
      notify  => Service['nagios-nrpe-server'],
    }
  }
}
