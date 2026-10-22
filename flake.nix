{
  description = "Flake de dev pour minira";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.zst";
  };

  outputs = { self, nixpkgs }: 
  let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      fhsEnv = pkgs.buildFHSEnv {
        name = "c-fhs";
        targetPkgs = pkgs: with pkgs; [
          clang
          glibc.dev
          gnumake
          clang-tools
          neovim
          sqlite
          sqlite.dev
          zsh
        ];
        runScript = "bash";
      };
  in
  {
    devShells.${system} = {
      default = pkgs.mkShell {
          packages = [ fhsEnv pkgs.sqlitebrowser ];
          shellHook = "exec c-fhs";
      };
    };
  };
}
