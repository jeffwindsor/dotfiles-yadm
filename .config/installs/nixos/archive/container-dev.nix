{ config, pkgs, ... }:{
  environment.systemPackages = with pkgs; [

    devbox                                    # instant, easy, predictable shells and containers.
    distrobox                                 # wrapper for podman that links home to containers for easy test and dev envs
    podman                                    # container (non-root) service

}
