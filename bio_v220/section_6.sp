locals {
  bio_v220_6_common_tags = merge(local.bio_v220_common_tags, {
    cis_section_id = "6"
  })
}

benchmark "bio_v220_6" {
  title         = "6 Asset Management"
  documentation = file("./bio_v220/docs/bio_v220_6.md")
  children = [
    control.bio_v220_6_1,
    control.bio_v220_6_2
  ]

  tags = merge(local.bio_v220_6_common_tags, {
    service = "OCI/Identity"
    type    = "Benchmark"
  })
}

control "bio_v220_6_1" {
  title         = "6.1 Create at least one compartment in your tenancy to store cloud resources"
  description   = "When you sign up for Oracle Cloud Infrastructure, Oracle creates your tenancy, which is the root compartment that holds all your cloud resources. You then create additional compartments within the tenancy (root compartment) and corresponding policies to control access to the resources in each compartment."
  query         = query.identity_tenancy_with_one_active_compartment
  documentation = file("./bio_v220/docs/bio_v220_6_1.md")

  tags = merge(local.bio_v220_6_common_tags, {
    cis_item_id = "6.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "OCI/Identity"
  })
}

control "bio_v220_6_2" {
  title         = "6.2 Ensure no resources are created in the root compartment"
  description   = "When you create a cloud resource such as an instance, block volume, or cloud network, you must specify to which compartment you want the resource to belong. Placing resources in the root compartment makes it difficult to organize and isolate those resources."
  query         = query.manual_control
  documentation = file("./bio_v220/docs/bio_v220_6_2.md")

  tags = merge(local.bio_v220_6_common_tags, {
    cis_item_id = "6.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "OCI/Identity"
  })
}
