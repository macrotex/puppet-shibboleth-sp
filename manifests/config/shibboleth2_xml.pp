class shibboleth_sp::config::shibboleth2_xml (
  String $metadata_providers,
  Array  $keypairs = [],
) {
  $version      = $shibboleth_sp::config::version
  $sp_entityid  = $shibboleth_sp::config::sp_entityid
  $idp_entityid = $shibboleth_sp::config::idp_entityid
  $remoteuser_attributes
                = $shibboleth_sp::config::remoteuser_attributes

  file {'/etc/shibboleth/shibboleth2.xml':
    ensure  => $shibboleth_sp::config::ensure,
    content => template('shibboleth_sp/etc/shibboleth/shibboleth2.xml.erb'),
  }

}
