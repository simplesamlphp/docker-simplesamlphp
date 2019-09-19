<?php

$metadata['https://idp.tutorial.stack-dev.cirrusidentity.com/saml2/idp/metadata.php'] = array (
  'metadata-set' => 'saml20-idp-remote',
  'entityid' => 'https://idp.tutorial.stack-dev.cirrusidentity.com/saml2/idp/metadata.php',
  'SingleSignOnService' =>
  array (
    0 =>
    array (
      'Binding' => 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect',
      'Location' => 'https://idp.tutorial.stack-dev.cirrusidentity.com/saml2/idp/SSOService.php',
    ),
  ),
  'SingleLogoutService' =>
  array (
    0 =>
    array (
      'Binding' => 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect',
      'Location' => 'https://idp.tutorial.stack-dev.cirrusidentity.com/saml2/idp/SingleLogoutService.php',
    ),
  ),
  'certData' => 'MIICFTCCAb+gAwIBAgIUBZ/UkF8qx1qytqw8gWUo3zrslTkwDQYJKoZIhvcNAQELBQAwXzELMAkGA1UEBhMCTk8xEzARBgNVBAgMClNvbWUtU3RhdGUxITAfBgNVBAoMGEludGVybmV0IFdpZGdpdHMgUHR5IEx0ZDEYMBYGA1UEAwwPaWRwLmV4YW1wbGUubmV0MB4XDTE5MDkxOTEwNDA0OVoXDTI5MDkxNjEwNDA0OVowXzELMAkGA1UEBhMCTk8xEzARBgNVBAgMClNvbWUtU3RhdGUxITAfBgNVBAoMGEludGVybmV0IFdpZGdpdHMgUHR5IEx0ZDEYMBYGA1UEAwwPaWRwLmV4YW1wbGUubmV0MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBALRkI06Ah5XOUUTeXyPUWNKB+t+YMue2kqmtVBEJW06fgLl0iUzdKn+9dnJuy/z2LwReIhZhoaN443SAKoj3a9cCAwEAAaNTMFEwHQYDVR0OBBYEFJMDiXHSBruU11sBe+5AWoj/DJ5tMB8GA1UdIwQYMBaAFJMDiXHSBruU11sBe+5AWoj/DJ5tMA8GA1UdEwEB/wQFMAMBAf8wDQYJKoZIhvcNAQELBQADQQAYqWHInAbr5RL4m6KFJoDs48yFUXXTJOyKtBiT9yNgkdwfVH4q0rj653TWohT0GFg54cMHqMiphDq4OvVb2hIi',
  'NameIDFormat' => 'urn:oasis:names:tc:SAML:2.0:nameid-format:transient',
);
