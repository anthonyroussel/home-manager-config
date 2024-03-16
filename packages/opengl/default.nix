{ pkgs, lib, ... }:
{
  systemd.user.sessionVariables = {
    LIBGL_DRIVERS_PATH = lib.makeSearchPathOutput "lib" "lib/dri" [ pkgs.mesa.drivers ];

    LIBVA_DRIVERS_PATH = lib.makeSearchPathOutput "out" "lib/dri" [
      pkgs.intel-media-driver
      pkgs.vaapiIntel
    ];

    __EGL_VENDOR_LIBRARY_FILENAMES = "${pkgs.mesa.drivers}/share/glvnd/egl_vendor.d/50_mesa.json";

    LD_LIBRARY_PATH = "${lib.makeLibraryPath [ pkgs.mesa.drivers ]}:${
      lib.makeSearchPathOutput "lib" "lib/vdpau" [ pkgs.libvdpau-va-gl ]
    }:${lib.makeLibraryPath [ pkgs.libglvnd ]}\${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}";
  };

  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };

  home.packages = with pkgs; [
    glxinfo
    intel-media-driver
    libvdpau-va-gl
    vaapiVdpau
    vaapiIntel
    libva-utils
    mesa.drivers
  ];

  home.file.".drirc".source = ./.drirc;
}
