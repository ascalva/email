# Proton Mail for the domain. Record values come from Proton's
# Settings -> Domain names -> <domain> -> setup page.

resource "aws_route53_record" "mx" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = var.domain
  type    = "MX"
  ttl     = 600
  records = [
    "10 mail.protonmail.ch",
    "20 mailsec.protonmail.ch",
  ]
}

# Route 53 holds one TXT record set per name, so the apex SPF policy and
# Proton's domain-verification token share this record.
resource "aws_route53_record" "apex_txt" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = var.domain
  type    = "TXT"
  ttl     = 600
  records = [
    "v=spf1 include:_spf.protonmail.ch ~all",
    "protonmail-verification=${var.proton_verification_token}",
  ]
}

resource "aws_route53_record" "dkim" {
  for_each = var.proton_dkim_targets

  zone_id = data.aws_route53_zone.this.zone_id
  name    = "${each.key}._domainkey.${var.domain}"
  type    = "CNAME"
  ttl     = 600
  records = [each.value]
}

resource "aws_route53_record" "dmarc" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = "_dmarc.${var.domain}"
  type    = "TXT"
  ttl     = 600
  records = ["v=DMARC1; p=reject"]
}

# WKD (Web Key Directory) delegated to keys.openpgp.org, which serves the
# verified public keys of this domain's addresses.
resource "aws_route53_record" "wkd" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = "openpgpkey.${var.domain}"
  type    = "CNAME"
  ttl     = 300
  records = ["wkd.keys.openpgp.org"]
}

# Only these CAs may issue certificates for the domain, its subdomains and
# wildcards: amazon.com covers ACM (the website), letsencrypt.org covers GitLab
# Pages (mind-palace) and keys.openpgp.org (openpgpkey).
resource "aws_route53_record" "caa" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = var.domain
  type    = "CAA"
  ttl     = 3600
  records = [
    "0 issue \"amazon.com\"",
    "0 issue \"letsencrypt.org\"",
  ]
}
