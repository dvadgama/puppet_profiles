class custom::puppet::service(
  $services = '',
  $service_defaults = '',
){
   create_resources(service, $services, $service_defaults)
}
