resource "tfe_organization" "new" {
  name                     = lookup(var.org_configuration, "name")
  email                    = lookup(var.org_configuration, "email")
  session_timeout_minutes  = lookup(var.org_configuration, "session_timeout_minutes")
  session_remember_minutes = lookup(var.org_configuration, "session_remember_minutes")
  collaborator_auth_policy = lookup(var.org_configuration, "auth_policy")
  owners_team_saml_role_id = lookup(var.org_configuration, "owner_team_saml_role_id")
}

resource "tfe_oauth_client" "new" {
  count            = var.vcs_enabled == true ? length(var.vcs_configuration) : 0
  organization     = tfe_organization.new.name
  api_url          = lookup(var.vcs_configuration[count.index], "api_url")
  http_url         = lookup(var.vcs_configuration[count.index], "http_url")
  oauth_token      = lookup(var.vcs_configuration[count.index], "oauth_token")
  private_key      = lookup(var.vcs_configuration[count.index], "private_key")
  service_provider = lookup(var.vcs_configuration[count.index], "service_provider")
}