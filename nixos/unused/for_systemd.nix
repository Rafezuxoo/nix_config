{ config, pkgs, ... }:

let

  monitorsXmlContent = builtins.readFile /home/raf/.config/monitors.xml;
  monitorsConfig = pkgs.writeText "gdm_monitors.xml" monitorsXmlContent;
in {
  systemd.tmpfiles.rules = [
    "L+ /run/gdm/.config/monitors.xml - - - - ${monitorsConfig}"
  ];

  #systemd.services.spoof-dpi = {
  #  enalbe = true;
  #  path = [ pkgs.nix ];
  #  serviceConfig = {
  #    ExecStart = "/nix/store//nix/store/9q3lsg3wlbsd87fdkw5b2h9nllv9wfnn-SpoofDPI-0.12.0/bin/spoofdpi";
  #  };
  #  wantedBy = [ "multi-user.target" ];
  #};
}
