{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/25.05";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        devShell = pkgs.stdenv.mkDerivation {
          name = "dev-env";
          dontBuild = true;
          dontInstall = true;
          
          buildInputs = [
            pkgs.bash
            pkgs.coreutils
            pkgs.curl
            pkgs.diff-so-fancy
            pkgs.fd
            pkgs.findutils
            pkgs.fish
            pkgs.git
            pkgs.gnutar
            pkgs.gzip
            pkgs.lazygit
            pkgs.lsd
            pkgs.lua
            pkgs.luarocks
            pkgs.man
            pkgs.ncurses
            pkgs.neovim
            pkgs.openssh_gssapi
            pkgs.python314
            pkgs.ripgrep
            pkgs.shadow
            pkgs.starship
            pkgs.sudo
            pkgs.tmux
            pkgs.unzip
            pkgs.wget
            pkgs.which
          ];
          
          shellHook = ''
            export SHELL=$(which fish)
            exec fish -i -C "
              set -e PATH
              set -ga PATH ${pkgs.bash}/bin
              set -ga PATH ${pkgs.coreutils}/bin
              set -ga PATH ${pkgs.curl}/bin
              set -ga PATH ${pkgs.diff-so-fancy}/bin
              set -ga PATH ${pkgs.fd}/bin
              set -ga PATH ${pkgs.findutils}/bin
              set -ga PATH ${pkgs.fish}/bin
              set -ga PATH ${pkgs.git}/bin
              set -ga PATH ${pkgs.gnutar}/bin
              set -ga PATH ${pkgs.gzip}/bin
              set -ga PATH ${pkgs.lazygit}/bin
              set -ga PATH ${pkgs.lsd}/bin
              set -ga PATH ${pkgs.lua}/bin
              set -ga PATH ${pkgs.luarocks}/bin
              set -ga PATH ${pkgs.man}/bin
              set -ga PATH ${pkgs.ncurses}/bin
              set -ga PATH ${pkgs.neovim}/bin
              set -ga PATH ${pkgs.openssh_gssapi}/bin
              set -ga PATH ${pkgs.python314}/bin
              set -ga PATH ${pkgs.ripgrep}/bin
              set -ga PATH ${pkgs.shadow}/bin
              set -ga PATH ${pkgs.starship}/bin
              set -ga PATH ${pkgs.sudo}/bin
              set -ga PATH ${pkgs.tmux}/bin
              set -ga PATH ${pkgs.unzip}/bin
              set -ga PATH ${pkgs.wget}/bin
              set -ga PATH ${pkgs.which}/bin
              $EXTRA_COMMANDS
              export PATH
            "
          '';
        };
      });
}
