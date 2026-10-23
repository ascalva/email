## 2.0.0 (2026-10-23)

### ⚠ BREAKING CHANGES

* Mail for ascalva.com moved from the SES → Lambda → Gmail forwarder to Proton Mail. Terraform now
  manages only DNS records: MX, SPF + Proton verification, DKIM (3 selectors), DMARC `p=reject`,
  WKD (keys.openpgp.org) and CAA (Amazon, Let's Encrypt). The forwarder module and Lambda are gone.
* Repository moved from GitLab to GitHub with fresh history; CI is GitHub Actions (fmt, validate,
  tflint) and releases use `@semantic-release/github`. Entries below are from the GitLab history.

## [1.0.7](https://gitlab.com/ascalva-projects/website/compare/v1.0.6...v1.0.7) (2025-12-21)


### Bug Fixes

* use new role ([2b53bc7](https://gitlab.com/ascalva-projects/website/commit/2b53bc7f0a13c887bb24592c0012f7bf5d4e5903))

## [1.0.6](https://gitlab.com/ascalva-projects/website/compare/v1.0.5...v1.0.6) (2025-12-19)


### Bug Fixes

* fix plan ([74a56b0](https://gitlab.com/ascalva-projects/website/commit/74a56b09c71a2e92ef25c292ab28c421ec760b0a))

## [1.0.5](https://gitlab.com/ascalva-projects/website/compare/v1.0.4...v1.0.5) (2025-12-18)


### Bug Fixes

* fix pipeline ([0096a3d](https://gitlab.com/ascalva-projects/website/commit/0096a3d6fa891f6ec0db7667cbdca447109b6d34))
* organize pipeline fragments ([c0bb496](https://gitlab.com/ascalva-projects/website/commit/c0bb496102da2e1e1200a38d9a678573de82b3f6))
* organize pipeline fragments ([aa0de0e](https://gitlab.com/ascalva-projects/website/commit/aa0de0e910a49efbd15ed8a1ec519773ae3c3ef4))

## [1.0.4](https://gitlab.com/ascalva-projects/website/compare/v1.0.3...v1.0.4) (2025-12-18)


### Bug Fixes

* fix plan output path ([ed84335](https://gitlab.com/ascalva-projects/website/commit/ed843350b21cc2921de9cecdece4f5f56fc8bf19))

## [1.0.3](https://gitlab.com/ascalva-projects/website/compare/v1.0.2...v1.0.3) (2025-12-18)


### Bug Fixes

* cleanup ([1eb614c](https://gitlab.com/ascalva-projects/website/commit/1eb614c5deb16ee4631e641bddcb2087948bbd20))

## [1.0.2](https://gitlab.com/ascalva-projects/website/compare/v1.0.1...v1.0.2) (2025-12-18)


### Bug Fixes

* fix workflow ([7df118b](https://gitlab.com/ascalva-projects/website/commit/7df118be529292def01423aae601b8328b9796bc))

## [1.0.1](https://gitlab.com/ascalva-projects/website/compare/v1.0.0...v1.0.1) (2025-12-18)


### Bug Fixes

* add workflow ([6cb88ba](https://gitlab.com/ascalva-projects/website/commit/6cb88bada609eb957d1ac0e4df1b5753ff5d9555))

# 1.0.0 (2025-12-18)


### Bug Fixes

* add semantic release ([6c3b84e](https://gitlab.com/ascalva-projects/website/commit/6c3b84e22d02b67c796d12d1918548b7e7757901))
* add semantic release ([47803fc](https://gitlab.com/ascalva-projects/website/commit/47803fcc9d3eb19e206a8fd61cd5c2b3eb06d2f2))
* add semantic release ([41beed1](https://gitlab.com/ascalva-projects/website/commit/41beed10696e4c4c60a1c3f09a6943100d69b9d2))
* add semantic release ([0f76490](https://gitlab.com/ascalva-projects/website/commit/0f76490060e9aab6dc2a812fc843495f3ed4da25))
* add semantic release ([cc96b9a](https://gitlab.com/ascalva-projects/website/commit/cc96b9ac3443ec13a5ef312e603e805271892144))
