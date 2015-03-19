class custom::hiera::config(
  $template ='',
  $config   ='',
  $symlink  = '',){

  file{ $config:
          ensure  => 'file',
          content => template($template),}

  file{ $symlink:
          ensure => 'link',
          target => $config,
          require => File["$config"], }
}
