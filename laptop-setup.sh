set -e
# xcode-select --install


if ! command -v brew &> /dev/null; then
	echo "Installing brew"
	curl -o /tmp/homebrew-install.sh https://raw.githubusercontent.com/Homebrew/install/master/install.sh
	bash /tmp/homebrew-install.sh
	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/kamyarghasemlou/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv)"
else 
	echo "Brew exists, updating..."
	brew update
fi

if ! command -v python3 &> /dev/null; then
	brew install python@3
	pip3 install --upgrade pip
	pip3 install ansible
fi

ansible-playbook main.yml --ask-become-pass
