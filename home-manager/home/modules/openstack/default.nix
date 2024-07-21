{
  programs.openstackclient = {
    enable = true;

    clouds = {
      "ar-ovh" = {
        cloud = "ovh-cloud";
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
