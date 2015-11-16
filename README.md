## Installation

Please run following commands in your terminal to install the files.

```terminal
git clone git://github.com/Archetylator/dotfiles your-dotfiles-folder
cd your-dotfiles-folder
./install.sh
```

For the first time `./install.sh` command will be failed, because an installer will try to find
a file with credentials. After a fail the installer will create this file in your-dotfiles-folder.
Please open it and fill in gaps with your sensitive informations like passwords, names, emails.  
The file with your credentials is safe, because it is ignored by default (see .gitignore).

The installer automatically will insert your sensitive data into your dot-files. For this reason the
dot-files are not symlinked, but copied to your home directory. Thus you should always run the
installer if you want to apply the changes from your-dotfiles-folder.

Next, please run an `./install.sh` command one more time.

## Inspirations & Acknowledgements

**install.sh**

* [Mathias Lafeldt](https://coderwall.com/p/xcoraw/simple-verbose-mode-for-your-shell-scripts)

**.bash_prompt**

* [Bruno "Polaco" Penteado](https://gist.github.com/bcap/5682077#file-terminal-control-sh)
* [Archlinux Wiki](https://wiki.archlinux.org/index.php/Color_Bash_Prompt)

**.gitmessage**

* [Chris Beams](http://chris.beams.io/posts/git-commit/)
* [Caleb Thompson from Thoughtbot](https://robots.thoughtbot.com/5-useful-tips-for-a-better-commit-message)
