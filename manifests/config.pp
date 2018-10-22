class shibboleth_sp::config (
  String        $ensure,
  Integer       $version = 3,
  String        $sp_entityid,
  String        $idp_entityid,
  Array[String] $remoteuser_attributes =
    ['eppn', 'persistent-id', 'targeted-id'],
  Array         $metadata_providers = [],
  Array         $keypairs = [],
) {

  if (!($ensure in ['present', 'absent'])) {
    crit("the ensure parameter must be one of 'absent' or 'present'")
  }

  if (!($version in [2, 3])) {
    crit ("the ensure parameter must be one of 'absent' or 'present'")
  }

  $metadata_strings  = $metadata_providers.map |$item| { file($item) }
  $metadata_combined = join($metadata_strings, "\n")

  ## Metadata providers
  class { 'shibboleth_sp::config::shibboleth2_xml':
    metadata_providers => $metadata_combined,
    keypairs           => $keypairs,
  }   

}
