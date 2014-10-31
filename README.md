git-current
===========

### Description
`git-current` is a small unobtrusive tool that adds 3 handy aliases to `git` standart commands: `pull-current` and `push-current` that equivalent to `git (pull|push) origin <current-working-branch>`, and `cwb` that show you current working branch.

### Why?
It becomes *very* convenient when you have to deal with a *ton* of branches during development: aliases are shorter than full command, you don't need to remember working branch name, there is no chance for typo etc.

### How-to

#### Use
To push:
```
$ git add somefile
$ git commit -m 'Added somefile'
$ git push-current
Counting objects: 1, done.
Delta compression using up to 2 threads.
Compressing objects: 100% (1/1), done.
Writing objects: 100% (1/1), 737 bytes | 0 bytes/s, done.
Total 1 (delta 1), reused 0 (delta 0)
...
```

To pull:
```
$ git pull-current
remote: Counting objects: 13, done.
remote: Compressing objects: 100% (7/7), done.
remote: Total 7 (delta 4), reused 0 (delta 0)
Unpacking objects: 100% (7/7), done.
...
```

To get current branch simple run `git cwb`.

#### Install
`/bin/bash -c 'git clone https://github.com/yumitsu/git-current.git && cd git-current && make install'`. `make install` should:

1. Create `~/.git-current` file with git aliases
2. Add `.git-current` to `[include]` section of your `~/.gitconfig`

#### Uninstall
Just run `make uninstall` and make sure that `~/.git-current` file was removed along with `[include]` section of `~/.gitconfig`.

### Issues & bugs
Despite the fact that I highly doubt there are (possible) bugs in such foolproof code, I concede there may be some issues with install process (although it is very simple too), so feel free to report them via [issue tracker](https://github.com/yumitsu/git-current/issues).
Thank you!

### License
[X11/MIT license](https://en.wikipedia.org/wiki/MIT_License).

### "Just go, read 'man git-config' and set ya git properly, scrub!"
Well, that wasn't bad at all, so let `git-cwb.sh` to belong here as a memento to unforgettable experience ~~of pain~~
