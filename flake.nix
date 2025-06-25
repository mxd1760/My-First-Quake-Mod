{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  outputs =
    { nixpkgs, self }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages."${system}";
    in
    {
      formatter."${system}" = pkgs.nixfmt-rfc-style;
      devShells."${system}".default = pkgs.mkShellNoCC {
        name = "shell-for-working-on-My-First-Quake-Mod";
        packages = with pkgs; [
          ericw-tools
          python3
          python3.pkgs.uv
        ];
        # This helps ensure that packages installed via uv actually work on
        # NixOS.
        shellHook = ''
          export UV_NO_BINARY=true
        '';
      };
    };
}
