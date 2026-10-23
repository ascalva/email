# email

DNS for mail on `ascalva.com`, hosted by [Proton Mail](https://proton.me/mail), managed with
Terraform in Route 53. Earlier versions ran an SES → Lambda → Gmail forwarder; that was replaced
by Proton (v2).

| record | purpose |
|---|---|
| MX | Proton's mail servers |
| TXT (apex) | SPF (`include:_spf.protonmail.ch`) + Proton domain verification |
| CNAME `protonmail*._domainkey` | DKIM (three Proton selectors) |
| TXT `_dmarc` | DMARC `p=reject` |
| CNAME `openpgpkey` | WKD via keys.openpgp.org |
| CAA | only Amazon (ACM) and Let's Encrypt may issue certificates |

All values are public DNS; nothing secret lives here. State is in S3 (encrypted).

```bash
make setup    # tools check + terraform init (needs AWS credentials)
make plan     # saved plan in terraform/tfplan.out
make deploy   # apply the saved plan
make lint     # fmt + validate + tflint
make docs     # regenerate terraform/README.md
```

CI (GitHub Actions) runs format, validate and tflint; it has no AWS access.
