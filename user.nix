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
    username = {
      format = "[$user]($style)";
      show_always = true;
    };
    hostname = {
      ssh_only = false;
      # ssh_symbol = "🌎 "  #  🌐 🌎 🌏
      ssh_symbol = "";  # remove altogether
      # style = "bold dimmed green" - default
      style = "green";
      format = "@[$ssh_symbol$hostname]($style)";
    };

    directory = {
      truncation_length = 2;
      truncation_symbol = ".../";
      truncate_to_repo = false;
      format = ":[$path]($style)[$read_only]($read_only_style) ";
      style = "blue";
    };

  };
}