# Uploads an API signing key for the specified user
resource "oci_identity_api_key" "user_api_key" {
  #Required
  key_value = tls_private_key.public_private_key_pair.public_key_pem
  user_id   = var.user_ocid
}

output "identity_user_fingerprint" {
  value = oci_identity_api_key.user_api_key.fingerprint
}

output "identity_user_key_value" {
  value = oci_identity_api_key.user_api_key.key_value
}
