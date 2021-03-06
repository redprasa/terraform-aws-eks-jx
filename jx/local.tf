provider "random" {
  version = "~> 2.1"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}

locals {
  generated_seed                = random_string.suffix.result
  # check if this makes sense
  oidc_provider_url             = replace(module.eks.cluster_oidc_issuer_url, "https://", "")
  jenkins-x-namespace           = "jx"
  cert-manager-namespace        = "cert-manager"
}
