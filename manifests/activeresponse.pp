# Wazuh App Copyright (C) 2019 Wazuh Inc. (License GPLv2)
#Define for a specific ossec active-response
define wazuh::activeresponse(
  $active_response_name               = 'Rednering active-response template',
  $active_response_disabled           = undef,
  $active_response_linux_ca_store     = undef,
  $active_response_ca_verification    = undef,
  $active_response_command            = undef,
  $active_response_location           = undef,
  $active_response_level              = undef,
  $active_response_agent_id           = undef,
  $active_response_rules_id           = [],
  $active_response_timeout            = undef,
  $active_response_repeated_offenders = [],

  $target_arg                         = 'ossec.conf',
  $order_arg                          = undef,
  $before_arg                         = undef,
  $content_arg                        = 'wazuh/fragments/_activeresponse.erb'
) {

  require wazuh::params_manager

  concat::fragment { $name:
    target  => 'ossec.conf',
    order   => 55,
    content => template('wazuh/fragments/_activeresponse.erb')
  }
}
