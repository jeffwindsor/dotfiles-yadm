{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  # shell packages
  nativeBuildInputs = with pkgs; [

  ];

  # hook executed on shell start
  shellHook = ''
    echo "Welcome to your new Nix Shell"
  '';

  # environment variables can be set directly
   COLOR = "green";

  # as well as importing other nix files
  # import ./password.nix;
}
