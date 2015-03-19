class profiles::puppet::hiera{

  $config   =  '/etc/puppet/hiera.yaml'
  $template =  "$module_name/hiera.erb"
  $symlink  =  '/etc/hiera.yaml'

  class{'::custom::hiera::config':
         config   => $config,
         template => $template,
         symlink  => $symlink,} ->

  Class['::profiles::puppet::hiera']
}
