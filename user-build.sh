#!/bin/bash -x

readonly RUBY19="1.9.3-p547"
readonly RUBY20="2.0.0-p481"
readonly RUBY21="2.1.2"
readonly CROSS_TERGET="1.9.3:2.0.0:2.1.2"
readonly PKG_GEMS="/vagrant/pkgs"

cpu_nums = `cat /proc/cpuinfo |grep processor|wc -l`
readonly CPU_NUMS=cpu_nums

if [ ! -d ~/.rbenv ]; then
    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
fi

if [ ! -d ~/.rbenv/plugins/ruby-build ]; then
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
fi

# setting PATH
export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
bash -l -c 'source ~/.bashrc'
. /vagrant/build-functions.sh

# Ruby 1.9.3
old_ruby_install_with_bundler $RUBY19
# Ruby 2.0.0
ruby_install_with_bundler $RUBY20
# Ruby 2.1.2
ruby_install_with_bundler $RUBY21

if [ ! -d ~/rroonga ]; then
    git clone https://github.com/ranguba/rroonga.git ~/rroonga
fi

cd ~/rroonga

# bundle install
bundle_install $RUBY19
bundle_install $RUBY20
bundle_install $RUBY21

# install cross ruby with rake-compiler
install_rake_compiler_cross_ruby $RUBY19
install_rake_compiler_cross_ruby $RUBY20
install_rake_compiler_cross_ruby $RUBY21

# cross-compile
cross_compile

# copy pkg/*.gem to /vagrant/pkgs
cp_pkg_gems
