<div align="center" border="0"><img src="src/logo.png" alt="dotfiles"></div>

# base-secure

reqruite the rewwears


Basejump uses [Ansible](https://www.ansible.com) to automate the setup of new hosts with hardened OS and SSH settings.

__NOTICE__ if you don't have Ansible installed, base-secure will do that first via Pip, automatically!

## requirements

* Linux
* python3

* pip3
* git
* sudo

## usage

Checkout the code, change into the directory:

```
git clone https://github.com/philcryer/base-secure.git
cd base-secure
```

Edit `ansible/group_vars/all.yml` and set your git username and email variables

Look over what's going to be done by reading `ansible/tasks/main.yml`, then run `base-secure`, which will automatically install Ansible if it's not already installed, via Pip, and then setup all of applications and dot files I can't live without

```
base-secure.sh
```

Do you want to just AUTORUN this *without prompts?* using one of those `curl` methods? I always say you shouldn't do this, it's a security risk, but look, I'm not your boss, and yolo, so why the hell not?

```
curl -s -L https://raw.githubusercontent.com/philcryer/base-secure/master/src/auto.sh -O; chmod 755 auto.sh; ./auto.sh
```

When it's done, close your terminal session, log back in and you should be all set. YMMV, Not responsible for lost or stolen articles, this offer not valid in Tennessee. Sorry Tennessee! 

## screenshot

<div align="center" border="0"><img src="src/screenshot.png" alt="basejump in action!"><br /><font size="1">Can it really be something I wrote if there's no ascii-art? That's a retorical question, the answer is no.</font></div>

## issues

* Linux: if you're not running Debian/GNU Linux _(recommended)_ or Ubuntu Linux, reach out, I'd like this tested on more Linux distros.

If you are and are having other issues or have suggestions, let me know by opening an [issue](https://github.com/philcryer/base-secure/issues) or making a [pull request](https://github.com/philcryer/base-secure/pulls).

## license 

The MIT License (MIT)

Copyright (c) 2021 philcryer

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

### thanks
