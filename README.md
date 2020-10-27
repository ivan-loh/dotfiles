dotfiles.git
============
Clone and run this on a new EC2 instance running Ubuntu 12.04.2 LTS to
configure your `bash` and `emacs` development environment as follows:

```sh
cd $HOME
git clone https://github.com/ivan-loh/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
mv .emacs.d .emacs.d~
ln -s dotfiles/.emacs.d .
cd dotfiles/.emacs.d
git clone https://github.com/auto-complete/popup-el.git
git clone https://github.com/auto-complete/auto-complete.git

```

See also http://github.com/ivan-loh/setup to install prerequisite
programs. If all goes well, in addition to a more useful prompt, now you can
do `emacs -nw hello.js` and hitting `C-c!` to launch an interactive SSJS
REPL.



#### Automated Shutdown

###### crontab
```
*/10 * * * *	/root/scripts/shutdown-check.sh
```

###### shutdown-check.sh

```sh
#!/bin/bash

sleep 300

u=`users`;
l=${#u};
if [ $l -lt 2 ]
then
	/usr/sbin/shutdown -h 5
fi
```
