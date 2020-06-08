output "organization_id" {
  description = "output the value of the Organization Id"
  value       = tfe_organization.new.id
}

output "oauth_token_id" {
  description = "output the value of the Oauth Token Id"
  value       = tfe_oauth_client.new.*.oauth_token_id
  sensitive   = true
}

