{
  description = "A basic flake to help develop qwlroots";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nix-filter.url = "github:numtide/nix-filter";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    wlroots-unstable = {
      url = "gitlab:wlroots/wlroots?host=gitlab.freedesktop.org";
      flake = false;
    };
  };

  outputs = { self, flake-utils, nix-filter, nixpkgs, wlroots-unstable }@input:
    flake-utils.lib.eachSystem [ "x86_64-linux" "aarch64-linux" "riscv64-linux" ]
      (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        rec {
          packages = import ./default.nix {
            inherit pkgs nix-filter;
            wlroots_0_17_src = wlroots-unstable;
          };

          devShells.default = pkgs.mkShell { 
            packages = with pkgs; [
              wayland-utils
              reuse
            ];

            inputsFrom = [
              packages.default
            ];

            shellHook = ''
              echo "welcome to qwlroots"
              echo "wlroots: $(pkg-config --modversion wlroots)"
              echo "wayland-server: $(pkg-config --modversion wayland-server)"
              export QT_LOGGING_RULES="*.debug=true;qt.*.debug=false"
              export MESA_DEBUG=1
              export EGL_LOG_LEVEL=debug
              export LIBGL_DEBUG=verbose
              export WAYLAND_DEBUG=1
            '';
          };
        }
      );
}
