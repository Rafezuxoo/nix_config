{ pkgs, config, libs, ... }:

{
      # Configure video drivers in X11
  services.xserver = {
    # videoDrivers = [ "amdgpu" ];
    videoDrivers = [ "nouveau" ];
    # videoDrivers = [ "modesetting" ];
  };

  # GPU setup
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        amdvlk
        # rocmPackages.clr       # AMD proprietary
        rocmPackages.clr.icd   # AMD proprietary
        # rocm-opencl-icd      # Opensourced
        # rocm-opencl-runtime  # Opensourced
        vaapiVdpau  # related to NVIDIA
      ];
      extraPackages32 = with pkgs; [
      	driversi686Linux.amdvlk
      ];
    };
  };

  # HIP
  # Most software has the HIP libraries hard-coded. You can work around it on NixOS by using:

  # NVIDIA discrete card setup
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
      version = "565.77"; # latest
      sha256_64bit = "sha256-CnqnQsRrzzTXZpgkAtF7PbH9s7wbiTRNcM0SPByzFHw=";
      sha256_aarch64 = "sha256-LSAYUnhfnK3rcuPe1dixOwAujSof19kNOfdRHE7bToE=";
      openSha256 = "sha256-Fxo0t61KQDs71YA8u7arY+503wkAc1foaa51vi2Pl5I=";
      settingsSha256 = "sha256-VUetj3LlOSz/LB+DDfMCN34uA4bNTTpjDrb6C6Iwukk=";
      persistencedSha256 = "sha256-wnDjC099D8d9NJSp9D0CbsL+vfHXyJFYYgU3CwcqKww=";
  };

  hardware.nvidia = {
    modesetting.enable = true;            # "false" by default
    powerManagement.enable = false;       # "true" by default
    #powerManagement.finegrained = true;   # "false" by default

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    open = false;

    # Enable the Nvidia settings menu, accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    #package = config.boot.kernelPackages.nvidiaPackages.latest;
  };


}
