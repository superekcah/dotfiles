# Some Basic Configurations

## vim
    ln -sf .dotfiles/vimrc ~/.vimrc
    ln -sf .dotfiles/gvimrc ~/.gvimrc
    mkdir -p ~/.vim/bundle
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    :BundleInstall!
    cd ~/.vim/bundle/Command-T/ruby/command-t
    ruby extconf.rb
    make

## screen


## zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	ln -sf .dotfiles/zshrc ~/.zshrc"
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
	p10k configure
