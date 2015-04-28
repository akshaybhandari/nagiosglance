class nagiosglance::setup {
  file { '/etc/nagios/nrpe.d/nrpe_command.cfg':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service['nagios-nrpe-server'],
    require => Package['nagios-nrpe-server'],
  }
  class { 'nagiosglance::setup::host':
    require => [ File['/etc/nagios/nrpe.cfg'], Package['nagios-nrpe-plugin', 'nagios-nrpe-server'] ],
  } ->
  class { 'nagiosglance::setup::services':
    service_list          => $::nagiosglance::service_list,
  } ->
  class { 'nagiosglance::setup::files': } ->
  class { 'nagiosglance::setup::commands':
    service_list          => $::nagiosglance::service_list,
  }
}
