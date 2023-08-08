{ pkgs, misc, ... }: {
  # FEEL FREE TO EDIT: This file is NOT managed by fleek. 
  programs.bash.initExtra = ''
    My Own override of the .bashrc
    if [ -f /etc/bashrc ]; then
        . /etc/bashrc
    fi
    source <(fleek completion bash)
  '';

 
}
