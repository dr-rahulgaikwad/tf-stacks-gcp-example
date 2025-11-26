# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "gcp" {
  audience = ["hcp.workload.identity"]
}

deployment "us-central1" {
  inputs = {
    identity_token        = identity_token.gcp.jwt
    audience              = "//iam.googleapis.com/projects/640632043466/locations/global/workloadIdentityPools/wi-pool-gcp-stacks-example/providers/wi-provider-gcp-stacks-example"
    project_id            = "hc-bcc838338420446c8f14b3effe4"
    service_account_email = "gcp-stacks-example@hc-bcc838338420446c8f14b3effe4.iam.gserviceaccount.com"
    region                = "us-central1"
  }
  # destroy = true
}

deployment "europe-west1" {
  inputs = {
    identity_token        = identity_token.gcp.jwt
    audience              = "//iam.googleapis.com/projects/640632043466/locations/global/workloadIdentityPools/wi-pool-gcp-stacks-example/providers/wi-provider-gcp-stacks-example"
    project_id            = "hc-bcc838338420446c8f14b3effe4"
    service_account_email = "gcp-stacks-example@hc-bcc838338420446c8f14b3effe4.iam.gserviceaccount.com"
    region                = "europe-west1"  # New region
  }
}

# # Auto-approve if there are no changes
# deployment_auto_approve "no_changes" {
#   check {
#     condition = (context.plan.changes.add == 0 &&
#       context.plan.changes.change == 0 &&
#     context.plan.changes.remove == 0)
#     reason = "Plan contains changes that require manual review"
#   }
# }
# # Auto-approve new deployments (new resources, no changes, no deletions)
# deployment_auto_approve "safe_changes" {
#   check {
#     condition = (context.plan.changes.add > 0 &&
#       context.plan.changes.change == 0 &&
#     context.plan.changes.remove == 0)
#     reason = "Plan adds new resources, no changes or resources removed"
#   }
# }
#
# deployment_group "us-central1" {
#   auto_approve_checks = [
#     deployment_auto_approve.no_changes,
#     deployment_auto_approve.safe_changes
#   ]
# }