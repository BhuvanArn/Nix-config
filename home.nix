inputs@{ config, pkgs, pkgs-latest, vscode-extensions, ... }:

rec {
  home.username = "barnaud";
  home.homeDirectory = "/home/barnaud";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.


  imports = [
    ./modules/bat.nix

    # for future use
    # ./modules/vscode.nix
  ];

  programs.bash = {
    enable = true;

    shellAliases = {
      ga = "git add";
      gcm = "git commit -m";
      gco = "git checkout";
      gp = "git push";
      gs = "git status";
      gpl = "git pull";
      poule = "git pull";
      pelle = "git pull";
      c = "clear";

      modifhome = "code ~/.config/home-manager/home.nix";
      modifconf = "code /etc/nixos/configuration.nix";
      restarthome = "home-manager switch";
      restartconf = "sudo nixos-rebuild switch";
      valou = "valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes";
    };
  };

  programs.git = {
    enable = true;
    userName = "Bhuvan Arnaud";
    userEmail = "bhuvan.arnaud@epitech.eu";
  };

  # Installer Alacritty
  programs.alacritty = {
    enable = true;

    # Configuration du terminal Alacritty
    settings = {
      font = {
        size = 10;
        normal = {
          family = "MartianMono Nerd Font";
        };
      };
      window = {
        padding = {
          x = 8;
          y = 8;
        };
        dynamic_padding = true;
        decorations = "Full";
      };
    };
  };

  programs.eza = {
    enable = true;

    enableBashIntegration = true;
    git = true;
    icons = "auto";
  };

  programs.starship = {
    enable = true;

    enableBashIntegration = true;

    settings = builtins.fromTOML ''
    format = """
    [░▒▓](#a3aed2)\
    $os\
    $username\
    [](bg:#769ff0 fg:#a3aed2)\
    $directory\
    [](fg:#769ff0 bg:#394260)\
    $git_branch\
    $git_status\
    [](fg:#394260 bg:#212736)\
    $nodejs\
    $rust\
    $golang\
    $php\
    [](fg:#212736 bg:#1d2230)\
    $time\
    $cmd_duration\
    [ ](fg:#1d2230)\
    \n$character"""

    [os]
    style = "bg:#a3aed2 fg:#090c0c"
    disabled = false

    [username]
    show_always = true
    style_user = "bg:#a3aed2 fg:#090c0c"
    style_root = "bg:color_red fg:color_white"
    format = '[ $user ]($style)'

    [directory]
    style = "fg:#e3e5e5 bg:#769ff0"
    format = "[ $path ]($style)"
    truncation_length = 3
    truncation_symbol = "…/"

    [directory.substitutions]
    "Documents" = "󰈙 "
    "Downloads" = " "
    "Music" = " "
    "Pictures" = " "

    [git_branch]
    symbol = ""
    style = "bg:#394260"
    format = '[[ $symbol $branch ](fg:#769ff0 bg:#394260)]($style)'

    [git_status]
    style = "bg:#394260"
    format = '[[($all_status$ahead_behind )](fg:#769ff0 bg:#394260)]($style)'

    [nodejs]
    symbol = ""
    style = "bg:#212736"
    format = '[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)'

    [rust]
    symbol = ""
    style = "bg:#212736"
    format = '[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)'

    [golang]
    symbol = ""
    style = "bg:#212736"
    format = '[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)'

    [php]
    symbol = ""
    style = "bg:#212736"
    format = '[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)'

    [time]
    disabled = false
    time_format = "%R" # Hour:Minute Format
    style = "bg:#1d2230"
    format = '[[  $time ](fg:#a0a9cb bg:#1d2230)]($style)'

    [cmd_duration]
    style = "bg:#1d2230"
    show_milliseconds = true
    min_time = 100
    format = '[[ $duration ](fg:#a0a9cb bg:#1d2230)]($style)'
  '';

  };

  nixpkgs.config.allowUnfree = true;

  fonts.fontconfig.enable = true;
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    vim
    discord
    vscode
    neofetch
    git
    linux-manual
    man-pages
    stdmanpages
    emacs
    spotify
    zulu17
    insomnia
    docker
    docker-compose
    scrcpy
    virtualbox
    beekeeper-studio

    alacritty
    starship
    nerdfonts
    imagemagick

    kdePackages.qtwebsockets

    # # You can install a package from a channel:

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Set the STARSHIP_CONFIG environment variable
  home.sessionVariables.STARSHIP_CONFIG = "${config.home.homeDirectory}/.config/starship.toml";

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
    home.file = {

    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/barnaud/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
