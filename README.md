# Some Basic Configurations

## vim
    ln -sf .dotfiles/vimrc ~/.vimrc
    ln -sf .fotfiles/gvimrc ~/.gvimrc
    mkdir -p ~/.vim/bundle
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    :BundleInstall!
    cd ~/.vim/bundle/Command-T/ruby/command-t
    ruby extconf.rb
    make
## screen
