class custom::puppet::config(
  $files = '',
  $file_defaults ='',
){
   create_resources('::custom::puppet::template', $files, $file_defaults)
}
