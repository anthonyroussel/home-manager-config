{ mkShell, pkgs }:

mkShell {
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
