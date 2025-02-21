# THIS FILE IS NOT USED ATM BY HOME-MANAGER OF MY CONFIGURATION
# I'M KEEPING IT FOR FUTURE USE
# if I ever want to use it (and if the nix-vscode-extension is still maintained)




{ pkgs, vscode-extensions, ... }:

{ pkgs-latest, vscode-extensions, ... }:

let
  extensions = vscode-extensions;
  pkgs = pkgs-latest;
in
{
  programs.vscode = {
    package = pkgs.vscode;
    enable = true;
    mutableExtensionsDir = false;

    extensions =
    with extensions.vscode-marketplace;
    with pkgs.vscode-extensions; [
      vscode-icons-team.vscode-icons
      eamodio.gitlens
      extensions.vscode-marketplace.mhutchie.git-graph
      shardulm94.trailing-spaces

      github.vscode-github-actions

      bbenoist.nix
      brettm12345.nixfmt-vscode

      llvm-vs-code-extensions.vscode-clangd
      twxs.cmake
      xaver.clang-format

      rust-lang.rust-analyzer
      tamasfe.even-better-toml
      vadimcn.vscode-lldb

      extensions.vscode-marketplace.sdras.night-owl

      tomoki1207.pdf
      streetsidesoftware.code-spell-checker

      justusadam.language-haskell
      haskell.haskell

      iliazeus.vscode-ansi

      ms-vscode.live-server

      # Epitech
      ms-vscode.cpptools
      ms-vscode.cpptools-extension-pack

      ms-python.python
      ms-python.vscode-pylance
      ms-python.isort
      ms-python.debugpy

      esbenp.prettier-vscode

      ms-toolsai.jupyter
      ms-toolsai.jupyter-renderers

      # vscode.markdown-language-features
      # vscode.html-language-features
      # vscode.css-language-features
      # vscode.json-language-features
      # vscode.debug-auto-launch
      # vscode.debug-server-ready
      # vscode.configuration-editing
      # vscode.emmet

      golang.go

      redhat.java

      Vue.volar

      JuanBlanco.solidity

      ms-azuretools.vscode-docker

      dbaeumer.vscode-eslint

      vscjava.vscode-gradle
      vscjava.vscode-java-debug
      vscjava.vscode-java-pack
      vscjava.vscode-maven

      twxs.cmake

      nicolaspolomack.epitech-c-cpp-headers
      lucasmarandat.epitech-coding-style-checker

      # vscode.extension-editing
      # vscode.git
      # vscode.git-base
      # vscode.github
      # vscode.github-authentication
      # vscode.grunt
      # vscode.gulp
      # vscode.ipynb
      # vscode.jake
      # vscode.media-preview
      # vscode.merge-conflict
      # vscode.microsoft-authentication
      # vscode.npm
      # vscode.references-view
      # vscode.search-result
      # vscode.simple-browser
      # vscode.tunnel-forwarding

      shardulm94.trailing-spaces

      eamodio.gitlens
      VisualStudioExptTeam.intellicode-api-usage-examples
      ms-vscode.js-debug
      ms-vscode.js-debug-companion
      alefragnani.project-manager
      ms-vscode-remote.remote-containers
      tomblind.scm-buttons-vscode
      monokai.theme-monokai-pro-vscode
      iliazeus.vscode-ansi
      github.vscode-github-actions
      github.copilot
      vscode-icons-team.vscode-icons
      vscjava.vscode-java-dependency
      vscjava.vscode-java-test
      ms-vscode.vscode-js-profile-table
      ms-toolsai.vscode-jupyter-cell-tags
      ms-toolsai.vscode-jupyter-slideshow
      VisualStudioExptTeam.vscodeintellicode
      ms-vsliveshare.vsliveshare
    ];

    keybindings = [
      {
        key = "ctrl+[Quote]";
        command = "terminal.focus";
        when = null;
      }
      {
        key = "ctrl+[Backquote]";
        command = "workbench.action.navigateBack";
        when = "canNavigateBack";
      }
      {
        key = "ctrl+alt+M";
        command = "workbench.action.terminal.sendSequence";
        args.text = "make\n";
      }
    ];

    userSettings = {
      "git.openRepositoryInParentFolders" = "always";
      "window.menuBarVisibility" = "toggle";

      "terminal.integrated.fontFamily" = "MartianMono Nerd Font";
      "terminal.integrated.fontSize" = 12;
      "terminal.integrated.tabs.focusMode" = "singleClick";
      "files.insertFinalNewline" = true;

      "terminal.integrated.shellIntegration.enabled" = false;

      "workbench.colorTheme" = "Viow Darker";
      "workbench.iconTheme" = "vscode-icons";
      "workbench.sideBar.location" = "right";
      "files.autoSave" = "afterDelay";
      "git.autofetch" = true;
      "diffEditor.ignoreTrimWhitespace" = false;

      "github.copilot.enable" = {
        "*" = true;
        "plaintext" = true;
        "markdown" = true;
        "scminput" = false;
        "javascript" = true;
      };

      "C_Cpp.default.compilerPath" = "/nix/store/*/bin/g++";
      "cmake.showOptionsMovedNotification" = false;
      "cmake.pinnedCommands" = [
        "workbench.action.tasks.configureTaskRunner"
        "workbench.action.tasks.runTask"
      ];

      "diffEditor.codeLens" = true;
      "explorer.confirmDragAndDrop" = false;
      "epitech-c-cpp-headers.username" = "BhuvanArn";
      "epitech-c-cpp-headers.login" = "ok";
      "epitech-c-cpp-headers.headerType" = "post2017";
      "epitech-c-cpp-headers.usePragmaOnce" = false;
      "epitech-c-cpp-headers.autoGenerateClasses" = false;
      "window.customTitleBarVisibility" = "auto";
      "update.mode" = "none";

      "terminal.integrated.profiles.linux" = {
        "bash" = {
          "path" = "bash";
          "icon" = "terminal-bash";
        };
        "zsh" = {
            "path" = "zsh";
        };
        "fish" = {
            "path" = "fish";
        };
        "tmux" = {
            "path" = "tmux";
            "icon" = "terminal-tmux";
        };
        "pwsh" = {
            "path" = "pwsh";
            "icon" = "terminal-powershell";
        };
      };

      # maybe useless, IDK yet
      "editor.hover.delay" = 500;
      "editor.minimap.renderCharacters" = false;
      "editor.bracketPairColorization.independentColorPoolPerBracketType" = true;
      "[makefile]"."editor.tabSize" = 8;
      "editor.inlayHints.fontSize" = 12;
      "cSpell.userWords" = [ "Epitech" ];
    };
  };
}