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
- you will need a bootstrap script to get the comple picture, which will be soon there in my GitHub
