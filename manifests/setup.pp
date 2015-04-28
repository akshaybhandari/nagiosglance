class nagiosglance::setup {
  class { 'nagiosglance::setup::services':
    service_list          => $::nagiosglance::service_list,
  } ->
  class { 'nagiosglance::setup::files': } ->
  class { 'nagiosglance::setup::commands':
    service_list          => $::nagiosglance::service_list,
  }
}
