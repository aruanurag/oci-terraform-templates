# OCI Terraform Templates

> generated

A collection of Oracle Cloud Infrastructure (OCI) Terraform templates for provisioning OCI services in a structured, reusable way.

## Repository structure

Each template lives in its own folder at the repository root, e.g.

- `compute-instance/`
- `network-vcn/`
- `db-autonomous/`

Each template directory includes:

- `main.tf` (root Terraform configuration)
- `variables.tf`
- `outputs.tf`
- `providers.tf` (optional)
- `modules/` (optional) - reusable components
- `README.md` (optional but recommended for template-specific usage)

## Getting started

1. Install Terraform (>= 1.0)
2. Set up OCI CLI config and API keys:
   - `~/.oci/config`
   - key files in `~/.oci/`
3. Choose template directory (e.g., `network-vcn`)

### Example workflow

```bash
cd network-vcn
terraform init
terraform plan -var-file=example.tfvars
terraform apply -var-file=example.tfvars
```

## Credentials and security

- Do not commit OCI credentials or private keys.
- Use environment variables or `tfvars` files with sensitive values managed securely.

## Lifetime and cleanup

To destroy resources created by a template:

```bash
cd <template-dir>
terraform destroy -var-file=example.tfvars
```

## Contribution guidelines

- Add new template folders by name, with clearly documented inputs/outputs.
- Include examples (`*.tfvars`, `README.md`) for each template.
- Ensure `terraform fmt` and `terraform validate` pass.

## Common variables

Templates may share conventions such as:

- `compartment_id`
- `region`
- `display_name`
- `freeform_tags`/`defined_tags`

## Support

For questions, issues, or new template suggestions, open a GitHub issue in this repository.