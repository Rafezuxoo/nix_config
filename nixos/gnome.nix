{ config, pkgs, ... } :
{
    services.xserver = {
	    enable = true;
	    displayManager.gdm.enable = true;
	    displayManager.gdm.wayland = true;
	    desktopManager.gnome.enable = true;
	    excludePackages = [ pkgs.xterm ];
    };

    environment.gnome.excludePackages = [ pkgs.gnome-tour ];

    services.gnome.core-utilities.enable = false;

    environment.systemPackages = with pkgs; [
        gnome-terminal
        nautilus
        gnome-calculator
        eog
        gnome-tweaks
    ] ++ (with pkgs.gnomeExtensions; [
        blur-my-shell
        caffeine
        pano
        appindicator
        night-light-slider-updated
        tiling-shell
        #x11-gestures
        #gnomeExtensions.fullscreen-to-empty-workspace
        #gnomeExtensions.workspace-isolated-dash
        #gnomeExtensions.gsconnect
        #gnomeExtensions.tilingnome
        #gnomeExtensions.dock-from-dash
        #gnomeExtensions.paperwm
        #gnomeExtensions.dash-to-dock
        #gnomeExtensions.dash-to-dock-workaround
        #gnomeExtensions.dash-to-panel
     ]);

}
