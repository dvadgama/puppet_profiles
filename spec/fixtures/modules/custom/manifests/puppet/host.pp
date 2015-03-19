class custom::puppet::host(
 $hostdata = '',
){
    create_resources(host, $hostdata)
}
