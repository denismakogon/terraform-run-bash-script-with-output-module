# terraform-run-bash-script-with-output-module
A Terraform module that runs bash script with an output value

## How to use this module

```terraform
module "run_script_with_output" {
  source = "git@github.com:denismakogon/terraform-run-bash-script-with-output-module.git?ref=main"

  result_key = "region_key"
  script_to_execute = split(" ", "/bin/bash ../../scripts/get_region_key_by_name.sh ${var.region}")
}
```

Bash script must have the following format:
```shell
#!/usr/bin/env bash

set -xe

region_name=${1}

region_key=$(oci iam region list | jq -r '.data[] | select(.name == "'${region_name}'") | .key | ascii_downcase')

jq -n --arg region_key "$region_key" '{"region_key":$region_key}'
```
