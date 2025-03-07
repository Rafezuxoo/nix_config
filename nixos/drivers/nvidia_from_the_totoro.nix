{
  lib,
  config,
  pkgs,
  ...
}:
/*let
  baseconfig = { allowUnfree = true; };
  unstalbe = import <nixos-unstable> {config = baseconfig; };
in*/
{

  services.xserver.videoDrivers = [ "nvidia" ];
  boot = {
    blacklistedKernelModules = [ "nouveau" ];
    kernelParams = [
      "nvidia.NVreg_EnableGpuFirmware=0"
      "nvidia-drm.modeset=1"
    ];
    kernelModules = [ "nvidia_uvm" ];

  };
  hardware = {
    nvidia = {
      modesetting.enable = false; # takes both nvidia-drm.modeset= and .fbdev to 1
      powerManagement.enable = true;
      open = true;
      #      package = config.boot.kernelPackages.nvidiaPackages.production;
      package = config.boot.kernelPackages.nvidiaPackages.mkDriver {

        version = "570.86.16";
        sha256_64bit = "sha256-RWPqS7ZUJH9JEAWlfHLGdqrNlavhaR1xMyzs8lJhy9U=";
        openSha256 = "sha256-DuVNA63+pJ8IB7Tw2gM4HbwlOh1bcDg2AN2mbEU9VPE=";
        settingsSha256 = "sha256-9rtqh64TyhDF5fFAYiWl3oDHzKJqyOW3abpcf2iNRT8=";
        usePersistenced = false;

      };
    };
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
  environment = {
    systemPackages = with pkgs; [ #.unstable
      #(gpufetch.override { cudaSupport = true; })
      nvtopPackages.nvidia
      gwe
      vulkan-tools
      #      nvidia-vaapi-driver
    ];
    shellAliases = {
      gwe = "setsid gwe";
      gputop = "nvidia-smi -l 1";
      gpu_temp = "nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits";
      nvidia-settings = "setsid nvidia-settings";
    };
  };

  systemd.services.nvidia-poweroff = rec {
    enable = true;
    description = "Unload nvidia modules from kernel";
    documentation = [ "man:modprobe(8)" ];

    unitConfig.DefaultDependencies = "no";

    after = [ "umount.target" ];
    before = wantedBy;
    wantedBy = [
      "shutdown.target"
      "final.target"
    ];

    serviceConfig = {
      Type = "oneshot";
      ExecStart = "-${pkgs.kmod}/bin/rmmod nvidia_drm nvidia_modeset nvidia_uvm nvidia";
    };
  };

}

