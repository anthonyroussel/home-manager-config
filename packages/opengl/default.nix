{ pkgs, lib, ... }:
{
  systemd.user.sessionVariables = {
    LIBGL_DRIVERS_PATH = lib.makeSearchPathOutput "lib" "lib/dri" [ pkgs.mesa ];

    LIBVA_DRIVERS_PATH = lib.makeSearchPathOutput "out" "lib/dri" [
      pkgs.intel-media-driver
      pkgs.intel-vaapi-driver
    ];

    __EGL_VENDOR_LIBRARY_FILENAMES = "${pkgs.mesa}/share/glvnd/egl_vendor.d/50_mesa.json";

    LD_LIBRARY_PATH = "${lib.makeLibraryPath [ pkgs.mesa ]}:${
      lib.makeSearchPathOutput "lib" "lib/vdpau" [ pkgs.libvdpau-va-gl ]
    }:${lib.makeLibraryPath [ pkgs.libglvnd ]}\${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}";
  };

  nixpkgs.config.packageOverrides = pkgs: {
    intel-vaapi-driver = pkgs.intel-vaapi-driver.override { enableHybridCodec = true; };
  };

  home.packages = with pkgs; [
    intel-media-driver
    intel-vaapi-driver
    libva-utils
    libva-vdpau-driver
    libvdpau-va-gl
    mesa
    mesa-demos
  ];

  home.file.".drirc".source = ./.drirc;
}
