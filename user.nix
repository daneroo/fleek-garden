{ pkgs, misc, ... }: {
  # FEEL FREE TO EDIT: This file is NOT managed by fleek. 
  programs.bash.initExtra = ''
    # (all hosts) override/append of the .bashrc

    # We prefer fleek to be installed with the canonical installer,
    #  but when that does not work (as in nixos for me currently)
    #  we have this alias as a fallback
    # if fleek command not found. Adding alias which uses `nix run`
    if ! command -v fleek &> /dev/null; then
       alias fleek='nix run github:ublue-os/fleek --'
    fi
  '';

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

    git_branch = {
      #format = "on [$symbol$branch(:$remote_branch)]($style) "
      symbol = "";  # default " "
      format = "$symbol$branch($style)";
      style = "bright-black";
    };

    git_status = {
      ahead = ">";  # default "⇡"
      behind = "<"; # default "⇣"
    };

    git_state = {
      # default format
      # format = '\([$state( $progress_current/$progress_total)]($style)\) '
      style = "bright-black";
    };

    cmd_duration = {
      show_milliseconds = true;
      format = "[$duration]($style) ";
      style = "yellow";
    };

    character = {
      # default symbols
      success_symbol = "[❯](green)";
      error_symbol = "[❯](red)";
      # success_symbol = '[➜](bold green)';
      # error_symbol = '[✗](bold red)';
      # success_symbol = '[\$](green)';
      # error_symbol = '[\$](red)';
    };

    kubernetes = {
      disabled = false;
      #detect_files = ['k8s']
      #detect_folders = ['k8s']
      #detect_extensions = ['yaml']
    };
  };
}