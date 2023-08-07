{ pkgs, misc, ... }: {
  # DO NOT EDIT: This file is managed by fleek. Manual changes will be overwritten.
   home.shellAliases = {
    "fleek" = "nix run github:ublue-os/fleek --";
    
    "fleeks" = "cd ~/.local/share/fleek";
    };
}
