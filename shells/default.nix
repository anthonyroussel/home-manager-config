{ callPackage }:

{
  android = callPackage ./android.nix { };
  buku = callPackage ./buku.nix { };
  devops = callPackage ./devops.nix { };
  front = callPackage ./front.nix { };
  gcloud = callPackage ./gcloud.nix { };
  nixpkgs = callPackage ./nixpkgs.nix { };
  python = callPackage ./python.nix { };
  rails = callPackage ./rails.nix { };
  rpi = callPackage ./rpi.nix { };
  ventoy = callPackage ./ventoy.nix { };
  video = callPackage ./video.nix { };
}
