{config, pkgs, ...} :
{

    programs.foot = {
        enable = true;
        settings = {
            main = {
                font = monospace:size=12;
            };
        };
    };
      
}
