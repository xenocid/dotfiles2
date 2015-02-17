set -e

. lib-ui.sh
. lib-misc.sh

info "Beginning bootstrapping for OS X...\n"

# Download and install Command Line Tools
if [[ ! -x /usr/bin/gcc ]]; then
	info "Installing XCode Command Line Tools\n"
	xcode-select --install
fi

# Download and install Homebrew
if [[ ! -x /usr/local/bin/brew ]]; then
	info "Installing Homebrew\n"
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Modify the path
export PATH=/usr/local/bin:$PATH

# Download and install zsh
if [[ ! -x /usr/local/bin/zsh ]]; then
	info "Installing zsh\n"
	brew install zsh
fi

# Download and install git
if [[ ! -x /usr/local/bin/git ]]; then
	info "Installing git\n"
	brew install git
fi

# Download and install python
if [[ ! -x /usr/local/bin/python ]]; then
	info "Installing Python\n"
	brew install python --framework --with-brewed-openssl
fi

# Download and install Ansible
if [[ ! -x /usr/local/bin/ansible ]]; then
	info "Installing Ansible"
	brew install ansible
fi

if [ ! "$SHELL" == "/usr/local/bin/zsh" ]; then
	info "Switching from bash to zsh...\n"	
	chsh -s $(which zsh)
	success "Done\n"
	info "You will need to add /usr/local/bin/zsh to the list of shells in System Preferences\n"
fi

if ! (brew list -1 | grep -q "^brew-cask$"); then
	info "Installing brew cask...\n"
	brew install caskroom/cask/brew-cask
fi

success "Bootstrapping is complete\n"
