{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;

    shellInit = ''
      if status is-interactive
          set fish_greeting ""
          set fish_key_bindings fish_vi_key_bindings
          fastfetch -l small

          function y
	        set tmp (mktemp -t "yazi-cwd.XXXXXX")
	        yazi $argv --cwd-file="$tmp"
	        if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
	    	    builtin cd -- "$cwd"
	        end
	        rm -f -- "$tmp"
          end
      end
    '';

    shellAliases = {
        rebuild = "sudo nixos-rebuild switch --flake ~/NixConfig/";
        upgrade = "sudo nixos-rebuild switch --upgrade --flake ~/NixConfig/";
        hm-switch = "home-manager switch --flake ~/NixConfig/";
        cg = "sudo nix-collect-garbage -d";
        #y = "yazi";
    };
  };
}
