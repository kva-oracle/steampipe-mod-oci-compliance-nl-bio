locals {
  bio_v220_common_tags = merge(local.oci_compliance_common_tags, {
    bio         = "true"
    bio_version = "v2.2.0"
  })
}

benchmark "bio_v220" {
  title         = "NL BIO v2.2.0"
  description   = "The NL BIO Oracle Cloud Infrastructure Foundations Benchmark, provides prescriptive guidance for establishing a secure baseline configuration for the Oracle Cloud Infrastructure environment."
  documentation = file("./bio_v220/docs/bio_overview.md")
  children = [
    benchmark.bio_v220_1,
    benchmark.bio_v220_2
  ]

  tags = merge(local.bio_v220_common_tags, {
    type = "Benchmark"
  })
}
