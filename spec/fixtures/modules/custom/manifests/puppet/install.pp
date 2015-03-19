class custom::puppet::install(
  $packages = '',
){
   create_resources('package',$packages)
} 
