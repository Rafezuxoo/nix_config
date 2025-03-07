{config, pkgs, inputs, ... }:
let
  unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.system};

  unstablePackages = with unstable; [
    oh-my-posh
  ];
in {
  home.username = "raf";
  home.homeDirectory = "/home/raf";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    hyprland
    hyprpaper
    hyprlock
    hyprshot
    #hyprpanel
    fzf
    clang-tools
    cmake
    foot
    fuzzel
    waybar
    wlogout
  ] ++ unstablePackages;

  home.file = {
  };

  home.sessionVariables = {
      #EDITOR = "neovim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  #services.emacs.enable = true;

  imports = [
    ./env/fish.nix
    ./env/oh-my-posh.nix
    ./env/zoxide.nix

    ./programs/neovim.nix
    ./programs/foot.nix
    ./programs/fastfetch.nix

    #./gnome/gnome.nix

    ./hyprland/waybar.nix
    ./hyprland/fuzzel.nix
    ./hyprland/hyprland.nix
  ];

  
  
}
