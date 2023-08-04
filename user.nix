{ pkgs, misc, ... }: {
  # FEEL FREE TO EDIT: This file is NOT managed by fleek. 
  programs.starship.settings = {
    format = builtins.concatStringsSep "" [
      "$username"
      "$hostname"
      "$kubernetes"
      "$directory"
      "$git_branch"
      "$git_state"
      "$git_status"
      "$cmd_duration"
      "$character"
    ];
  };
}