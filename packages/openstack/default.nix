{ pkgs
, config
, lib
, ...
}:

{
  sops.secrets = {
    "openstack_project_id" = { };
    "openstack_project_name" = { };
    "openstack_username" = { };
    "openstack_password" = { };
  };

  # Hack to replace secrets in configuration file after switch
  #
  systemd.user.services.openstack-client-replace-secrets = {
    Service = {
      Type = "simple";

      # config.sops.secrets."openstack_project_name".path does not work
      # and returns "%r/secrets/openstack_project_name" value instead of the real path
      #
      ExecStart = pkgs.writeShellScript "replace-secrets" ''
        user_id=$(id -u)

        ${lib.getExe pkgs.replace-secret} "@@PROJECT_ID@@" \
          "/run/user/$user_id/secrets/openstack_project_id" \
          "${config.home.homeDirectory}/.config/openstack/clouds.yaml"

        ${lib.getExe pkgs.replace-secret} "@@PROJECT_NAME@@" \
          "/run/user/$user_id/secrets/openstack_project_name" \
          "${config.home.homeDirectory}/.config/openstack/clouds.yaml"

        ${lib.getExe pkgs.replace-secret} "@@USERNAME@@" \
          "/run/user/$user_id/secrets/openstack_username" \
          "${config.home.homeDirectory}/.config/openstack/clouds.yaml"

        ${lib.getExe pkgs.replace-secret} "@@PASSWORD@@" \
          "/run/user/$user_id/secrets/openstack_password" \
          "${config.home.homeDirectory}/.config/openstack/clouds.yaml"
      '';
    };
  };

  programs.openstackclient = {
    enable = true;

    clouds = {
      "ar-ovh" = {
        cloud = "ovh-cloud";
        auth = {
          project_id = "@@PROJECT_ID@@";
          project_name = "@@PROJECT_NAME@@";
          username = "@@USERNAME@@";
          password = "@@PASSWORD@@";
        };
        identity_api_version = 3;
        regions = [
          "GRA"
          "GRA5"
          "GRA9"
          "GRA11"
          "RBX-1"
          "SBG5"
        ];
        region_name = "GRA";
      };
    };

    publicClouds = {
      "ovh-cloud" = {
        auth = {
          auth_url = "https://auth.cloud.ovh.net/v3";
          user_domain_name = "Default";
          project_domain_name = "Default";
        };
      };
    };
  };
}
