data "tfe_team" "admin" {
  for_each     = toset(["owners"])
  name         = each.key
  organization = var.organization
}
