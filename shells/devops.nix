{ mkShell, pkgs }:

mkShell {
  shellHook = ''
    export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache"
    mkdir -p "$TF_PLUGIN_CACHE_DIR"
  '';

  packages = with pkgs; [
    pre-commit
    openstackclient-full
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
    terraform-plugin-docs
    tflint
    terramate
    terragrunt
    tfupdate
    terrascan
    terraspace

    # Kubernetes
    kubernetes-helm
  ];
}
