{ config, pkgs, ... }:{

  # sound services
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  #sound.enable = true;
  hardware.pulseaudio.enable = false;

}
