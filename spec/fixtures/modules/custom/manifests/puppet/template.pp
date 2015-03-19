define custom::puppet::template(
 $owner = root,
 $group = root,
 $template = '',
 $ensure   = '',
){

  file { $title:
           owner => $owner,
           group => $group,
           mode  => $mode,
           content => template($template),}

}
