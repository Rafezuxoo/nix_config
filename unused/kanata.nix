{ config, pkgs, ...}:

services = {
    kanata = {
    	enable = true;
	keyboards = {
	   default.config = biltins.readFile ./kanata.kbd;
	}
    }
}





