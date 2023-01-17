set -e
# xcode-select --install


if ! command -v brew &> /dev/null; then
	echo "Installing brew"
	curl -o /tmp/homebrew-install.sh https://raw.githubusercontent.com/Homebrew/install/master/install.sh
	bash /tmp/homebrew-install.sh
	echo '# Set PATH, MANPATH, etc., for Homebrew.' >> ~/.zprofile
	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv)"	
else 
	echo "Brew exists, updating..."
	brew update
fi

if ! command -v ansible &> /dev/null; then
	brew install ansible
fi

ansible-playbook main.yml --ask-become-pass
