{ config, pkgs, ... }:
{
    programs.fuzzel = {
          enable = true;
          settings = {
              main = {
                  terminal = "${pkgs.foot}/bin/foot";
                  layer = "overlay";
              };
              colors = {
                  background = "262626bf";    
                  text = "ffffffff";
                  selectedtext = "fffffff";
              };
          };
      };
}
