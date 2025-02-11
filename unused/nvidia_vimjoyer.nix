{ pkgs, ...}:

{
	hardware.opengl = {
		enable = true;
		driSupport32Bit = true;
	};
	
	services.xserver.videoDrivers = ["nvidia"];
	hardware.nvidia.modesetting.enable = true;
}
