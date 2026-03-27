{
  description = "id3v1669 system flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";
    sops-nix.url = "github:Mic92/sops-nix";
    nur.url = "github:nix-community/NUR";
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
    dcgt.url = "github:id3v1669/Dynamic-Color-GTK-Theme";
    awww = {
      url = "git+https://codeberg.org/LGFae/awww";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lsfg-vk = {
      url = "github:pabloaul/lsfg-vk-flake/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lan-mouse = {
      url = "github:feschber/lan-mouse";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    base16x2 = {
      url = "github:id3v1669/base16x2-color-shemes";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ndct-sddm = {
      url = "github:id3v1669/ndct-sddm-corners";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    eww = {
      url = "github:id3v1669/eww";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    cti = {
      url = "github:id3v1669/cosmic-theme-import";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    swhkdp = {
      url = "github:id3v1669/swhkdp";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    waysip = {
      url = "github:waycrate/waysip";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    prism-launcher = {
      url = "github:PrismLauncher/PrismLauncher/release-9.x";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs: let
    mkSystem = (import ./lib/mkSyst.nix {inherit inputs;}).mkSyst;
  in {
    formatter.x86_64-linux = inputs.nixpkgs.legacyPackages.x86_64-linux.alejandra;
    nixosConfigurations = {
      allahhypr = mkSystem {
        hostname = "allah";
        envir = "Hyprland";
        bootloader = {
          type = "opencore";
          timeout = 7;
        };
        cpuvar = {
          type = "intel";
          hasIntegrated = false;
        };
        uservars = {
          name = "user";
          description = "mfinikov";
          domain = "none";
          wp = "default3.png";
          owner = "mfinikov";
          sleeptimeout = 1200;
        };
        brightnesctrl = {
          up = "light -A 5";
          down = "light -U 5";
        };
        gpuvar = {
          type = "nvidia";
          tech = "prime";
        };
      };
    };
  };
}
