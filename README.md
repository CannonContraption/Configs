# Configs
## A collection of CannonContraption's Config Files

This repo contains my i3, bash, and vim config files. Enjoy!

## Using the i3 config file
Copy i3/config into either .config/i3, or rename it .i3config and put it in your home

## Using the bashrc
Take the scripts in the shell/binscripts directory, and make sure they are in ~/bin. If ~/bin doesn't exist, it needs to be created. This makes the git integration work.

Take the bashrc file and then copy it to ~/.bashrc, and if you're like me, also symlink it to ~/.bash_profile.

If you want to enable my SystemD based SSH Agent service (got it mostly from the archwiki, full disclosure) then copy shell/SystemD/ssh-agent.service to .config/systemd/user. Once you've done this, type

    sudo systemctl --user enable ssh-agent
    sudo systemctl --user start ssh-agent

If you want this disabled, please remove the export SSH_AUTH_SOCK line from the bashrc file.

## Using the Vim config
copy the vim config file to .vimrc
