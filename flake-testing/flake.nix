{
  # https://github.com/nix-community/home-manager#nix-flakes
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-old.url = "github:nixos/nixpkgs/nixos-21.11";
    home-manager.url = "github:nix-community/home-manager/release-21.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # https://github.com/nix-community/NUR#flake-support
    nur.url = github:nix-community/NUR;
    # https://github.com/ryantm/agenix#flakes
    agenix.url = "github:ryantm/agenix";

    deploy-rs = {
      url = "github:serokell/deploy-rs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  outputs = { self, home-manager, nixpkgs, nixpkgs-stable, agenix, nur, ... }@inputs:
    let system = "x86_64-linux";
    in
    {
      homeConfigurations."mutong233@mygensou.cn" = home-manager.lib.homeManagerConfiguration {
        inherit system;

        # https://nix-community.github.io/home-manager/nixos-options.html
        extraSpecialArgs = { inherit inputs system; };

        username = "mutong233";
        homeDirectory = "/home/mutong233";

        configuration = { pkgs, ... }: {
          imports = [ ./home.nix ];

          nixpkgs.overlays = (with inputs; [ nur.overlay deploy-rs.overlay ]);

          home.packages = [ pkgs.deploy-rs.deploy-rs ]
          ++ [ agenix.defaultPackage.x86_64-linux ];
        };
      };
    };
}
