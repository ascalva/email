variable "domain" {
  description = "Domain to be used"
  type        = string
  default     = "ascalva.com"
}

variable "proton_verification_token" {
  description = "Proton domain-verification token (the value after protonmail-verification=)"
  type        = string
  default     = "f8fcab14154a2b32451b3e7f04497e1cdb86a5d1"
}

variable "proton_dkim_targets" {
  description = "Proton DKIM CNAME targets keyed by selector (protonmail, protonmail2, protonmail3), from Proton's domain setup page"
  type        = map(string)
  default = {
    protonmail  = "protonmail.domainkey.dyeiqtdkomdihitzaihkhx3sjosjwdu7vie7fbog4hlfeuer4uf5a.domains.proton.ch."
    protonmail2 = "protonmail2.domainkey.dyeiqtdkomdihitzaihkhx3sjosjwdu7vie7fbog4hlfeuer4uf5a.domains.proton.ch."
    protonmail3 = "protonmail3.domainkey.dyeiqtdkomdihitzaihkhx3sjosjwdu7vie7fbog4hlfeuer4uf5a.domains.proton.ch."
  }

  validation {
    condition     = alltrue([for selector in keys(var.proton_dkim_targets) : contains(["protonmail", "protonmail2", "protonmail3"], selector)])
    error_message = "Keys must be the Proton DKIM selectors: protonmail, protonmail2, protonmail3."
  }
}
