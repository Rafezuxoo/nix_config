{ config, pkgs, ... } :
{
    programs.waybar = {
          enable = true;
          settings = {
              mainBar = {
                  layer = "top";
                  height = 30;
                  output = [ "DP-1" ];
                   modules-left = [
                      "hyprland/workspaces"
                      "hyprland/mode"
                  ];
                  modules-center = [
                      "sway/window"
                      "idle_inhibitor"
                  ];
                  modules-right = [
                      "tray"
                      "custom/scratchpad_indicator"
                      "pulseaudio"
                      "custom/power"
                      "cpu"
                      "memory"
                      "temperature"
                      "keyboard-state"
                      "hyrpland/language"
                      "clock"
                      "tray"
                  ];

                  idle_inhibitor = {
                      format = "{icon}";
                      format-icons = {
                          activated = "";
                          deactivated = "";
                      };
                  };

                  tray = {
                      icon-size = 15;
                      spacing = 10;
                  };

                  "custom/power" = {
                      format = " ";
                      "on-click" = "wlogout";
                  };
              };
          };
          style = ''
           

          '';
      };
}
