{ mkShell, pkgs }:

mkShell {
  shellHook = ''
    export TF_PLUGIN_CACHE_DIR=$HOME/.terraform.d/plugin-cache
  '';

  packages = with pkgs; [
    pre-commit
    awscli2
    python3Packages.boto3
    python3Packages.botocore
    steampipe

    # Ansible
    ansible
    sshpass
    # vagrant

    # Password mgmt
    keybase

    # Terraform
    atlantis
    terraform
    opentofu
    trivy
    terraform-docs
    tflint
    terramate
    terragrunt
    tfupdate
    terrascan
    terraspace
  ];
}
