class shibboleth_sp::install (
  $shibd_user   = '_shibd',
  $shibd_groups = ['ssl-cert'],
) {

  user { $shibd_user:
    groups => $shibd_groups,
  }

}
