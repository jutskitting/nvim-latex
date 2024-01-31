{
  description = "A minimal Neovim setup";

  inputs = {
    nixpkgs = {
	   url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    neovim = {
      url = "github:neovim/neovim/stable?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, neovim,flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:

      let
        overlayFlakeInputs = prev: final: {
          neovim = neovim.packages.x86_64-linux.neovim;
        };

        overlayNeovim = prev: final: {
          customNeovim = import ./packages/nvimConfig.nix {
            pkgs = final;
          };
        };

        pkgs = import nixpkgs {
          inherit system;
          overlays = [ overlayFlakeInputs overlayNeovim ];
        };

      in {

        packages.${system}.default = pkgs.customNeovim;

        apps.${system}.default = {
          type = "app";
          program = "${pkgs.customNeovim}/bin/nvim";
        };

        devShells.default = pkgs.mkShell {
            buildInputs = with pkgs; [
              customNeovim
              texliveBasic
              latexrun
              texlab
            ];
        };
      }

    );
}

