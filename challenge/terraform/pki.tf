/*
  Important Security Notice

  The private key generated by this resource will be stored unencrypted in your Terraform state file.

  ** Use of this resource for production deployments is not recommended. **

  Instead, generate a private key file outside of Terraform and distribute it securely to the system where Terraform will be run.
*/

locals {
  // 5 years
  validity_period_hours = 43800
}

resource "random_password" "encryption-key" {
  length = 32
  special = true
  override_special = "_%@"
}