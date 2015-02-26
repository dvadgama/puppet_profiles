class profiles::puppet::master{

  $file_defaults    = hiera_hash('file_defaults')
  $service_defaults = hiera_hash('service_defaults')

  $data = hiera_hash('puppetmaster')

  $packages = $data['packages']
  $files    = $data['files']  
  $services = $data['services']
  $hostdata = $data['host']

  class{'::custom::puppet::host': 
         hostdata => $hostdata, } ->

  class{'::custom::puppet::install':
         packages => $packages,} ->

  class{'::custom::puppet::config':
         files         => $files,
         file_defaults => $file_defaults,} ->
  
  class{'::custom::puppet::service':
         services         => $services,
         service_defaults => $service_defaults,}->

  Class['::profiles::puppet::master']  

}
