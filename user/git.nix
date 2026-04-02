{ config, ... }:

{
    programs.git = {   # can use home-manager normally as well as with persistence
        enable = true;
        settings = {
            user = {
                name  = "hyperboly";
                email = "johnwuonmail@gmail.com";
            };
        };
    };
}
