class nagiosglance::setup::files {
  file { "check_memory.sh_${hostname}":
    ensure => present,
    path   => '/usr/lib/nagios/plugins/check_memory.sh',
    source => 'puppet:///modules/nagiosglance/check_memory.sh',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
  file { "check_service.sh_${hostname}":
    ensure => present,
    path   => '/usr/lib/nagios/plugins/check_service.sh',
    source => 'puppet:///modules/nagiosglance/check_service.sh',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
}
