{ lib, pkgs, ... }:

{
  programs.awscli = {
    enable = true;
    settings = {
      "default" = {
        region = "eu-west-3";
        output = "json";
      };
      "sso-session rsl" = {
        sso_start_url = "https://aroussel.awsapps.com/start/";
        sso_region = "eu-west-3";
        sso_registration_scopes = "sso:account:access";
      };
      "profile rsl-main" = {
        sso_session = "rsl";
        sso_account_id = "085148030565";
        sso_role_name = "admin";
        region = "eu-west-3";
        output = "json";
      };
      "profile rsl-udemy" = {
        sso_session = "rsl";
        sso_account_id = "894251631406";
        sso_role_name = "admin";
        region = "eu-west-3";
        output = "json";
      };
    };
  };
}
