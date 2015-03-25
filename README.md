## puppet_profiles
This module demonstrates how one can build useful profiles from the availbe puppet moudle and keep 'em all under one roof

##Current profiles
- puppet::hiera: Installs the hiera config 
- puppet::master: Installs the pupppet-master using hiera data

##Todo
Add profiles , such as listed below, for pragmatic use
- webserver::apache
- webserver::tomcat
- database::mysql

##Note
- This is not a stand alone moudle , it is used in conjustion with the puppet moudles & bootscript.
- you will need this [bootstrap](https://github.com/dvadgama/machine_build_scripts/tree/master/bootstrap) script to understand the full picture
- you will need to execute bundle install before running rake spec or rake beaker
- you will need to install ca-certificates ( apt-get install ca-certificates) for Beaker to work
- handy commnd to run a beaker test BEAKER_destroy=onpass BEAKER_provision=yes rake beaker 
