Vagrant box for Cross compiling Rroonga
===

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
pkgs/rroonga-4.0.5-x86-mingw32.gem
pkgs/rroonga-4.0.5-x64-mingw32.gem
pkgs/rroonga-4.0.5.gem
...
```
