<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.14.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.26 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.27.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [aws_route53_record.apex_txt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.caa](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.dkim](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.dmarc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.mx](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.wkd](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_domain"></a> [domain](#input\_domain) | Domain to be used | `string` | `"ascalva.com"` | no |
| <a name="input_proton_dkim_targets"></a> [proton\_dkim\_targets](#input\_proton\_dkim\_targets) | Proton DKIM CNAME targets keyed by selector (protonmail, protonmail2, protonmail3), from Proton's domain setup page | `map(string)` | <pre>{<br/>  "protonmail": "protonmail.domainkey.dyeiqtdkomdihitzaihkhx3sjosjwdu7vie7fbog4hlfeuer4uf5a.domains.proton.ch.",<br/>  "protonmail2": "protonmail2.domainkey.dyeiqtdkomdihitzaihkhx3sjosjwdu7vie7fbog4hlfeuer4uf5a.domains.proton.ch.",<br/>  "protonmail3": "protonmail3.domainkey.dyeiqtdkomdihitzaihkhx3sjosjwdu7vie7fbog4hlfeuer4uf5a.domains.proton.ch."<br/>}</pre> | no |
| <a name="input_proton_verification_token"></a> [proton\_verification\_token](#input\_proton\_verification\_token) | Proton domain-verification token (the value after protonmail-verification=) | `string` | `"f8fcab14154a2b32451b3e7f04497e1cdb86a5d1"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->