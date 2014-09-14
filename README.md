Vagrant box for Cross compiling Rroonga
===

__warning: This repository is deprecated. Use [this Vagrant box](https://github.com/ranguba/rroonga/tree/master/build/windows) for cross compiling Rroonga.__

Vagrant box for cross compiling Rroonga.

```bash
$ vagrant up
```

Then, cross compiling....

Cross compiled gems and built gem are copied under pkgs:

```bash
$ ls pkgs/
```

```log
rroonga-4.0.5-x64-mingw32.gem
rroonga-4.0.5-x86-mingw32.gem
rroonga-4.0.5.gem
```
