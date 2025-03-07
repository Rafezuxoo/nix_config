{ config, pkgs, inputs, ... }:
let
    confPath = "/etc/amnezia/INTERFACE.conf";
    programPath = "/run/current-system/sw/bin/awg-quick";
in {
  # Включаем службу amneziawg
  systemd.services.amneziawg = {
    description = "AmneziaWG WireGuard Interface";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${programPath} up ${confPath}";
      ExecStop = "${programPath} down ${confPath}";
      RemainAfterExit = true;
    };
  };
}
