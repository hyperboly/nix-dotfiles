{ config, ... }:

{
    programs.git = {   # can use home-manager normally as well as with persistence
        enable = true;
        userName  = "hyperboly";
        userEmail = "johnwuonmail@gmail.com";
    };
}
