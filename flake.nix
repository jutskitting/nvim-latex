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
  };

  outputs = { self, nixpkgs, neovim }:
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
        system = "x86_64-linux";
        overlays = [ overlayFlakeInputs overlayNeovim ];
      };

    in {
      packages.x86_64-linux.default = pkgs.customNeovim;
      apps.x86_64-linux.default = {
        type = "app";
        program = "${pkgs.customNeovim}/bin/nvim";
      };

      devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            customNeovim
          ];
      };

    };
}

