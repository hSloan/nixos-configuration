{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Editors
    (neovim.override { vimAlias = true; })
    # emacs # in user config, due to customization

    # Development
    gitAndTools.tig

    # Admin
    acpi
    file
    gptfdisk
    gparted
    htop
    pciutils
    tree
    wget
    termite.terminfo

    # Nix
    nix-repl
    nix-prefetch-scripts
    #strategoPackages018.strategoxt # It's broken
  ];

  nix = {
    # Don't use unstable if there is a schema change!
    #package = pkgs.nixUnstable;
    useSandbox = true;
    binaryCaches = [
      "http://cache.nixos.org/"
      "https://nixcache.reflex-frp.org"
    ];
    trustedBinaryCaches = [
      "https://hydra.nixos.org/"
      "http://hydra.cryp.to"
    ];
    binaryCachePublicKeys = [
      "ryantrinkle.com-1:JJiAKaRv9mWgpVAz8dwewnZe0AzzEAzPkagE9SP5NWI="
    ];
  };
}
