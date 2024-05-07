{ config, pkgs, ...}:
{ 
 programs.zsh = {
  enable = true;

  # start sway at startup
  loginShellInit = ''
    [[ "$(tty)" == /dev/tty1 ]] && sway"
  '';

  enableCompletion = true;
  # autosuggestion.enable = true;
  syntaxHighlighting.enable = true;

  shellAliases = {
    ll = "ls -l";
  };
  history.size = 10000;
  history.path = "${config.xdg.dataHome}/zsh/history";
  oh-my-zsh = {
    enable = true;
    plugins = [ "git" ];
    theme = "robbyrussell";
  };
};
}

