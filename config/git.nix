{ config, pkgs, ...}:
{ 
    programs.git = {
        enable = true;
        userName = "Lan Pavletič";
        userEmail = "pavletic.lan@gmail.com";
        extraConfig = {
            commit.gpgsign = true;
            gpg.format = "ssh";
            user.signingkey = "~/.ssh/id_ed25519.pub";
        };
    };
}

