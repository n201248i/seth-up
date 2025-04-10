sudo apt update

if ! command -v bun &> /dev/null; then
    echo "bun is not installed"
    sudo curl -fsSL https://bun.sh/install | bash
fi

if ! command -v node &> /dev/null; then
    echo "node is not installed"
    # Download and install nvm:
    sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
    # in lieu of restarting the shell
    sudo \. "$HOME/.nvm/nvm.sh"
    sudo nvm install 22
    sudo nvm current # Should print "v22.14.0".
    # Verify npm version:
    node -v # Should print "v22.14.0".
    npm -v # Should print "10.9.2".
fi

if ! command -v git &> /dev/null; then
    echo "git is not installed"
    sudo apt install git
fi

# Check if SSH ED25519 key exists, if not, generate one
if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
    echo "SSH ED25519 key does not exist, generating one"
    sudo ssh-keygen -t ed25519 -f "$HOME/.ssh/id_ed25519" -N ""
    echo "Here is the public part of the SSH ED25519 key:"
    cat "$HOME/.ssh/id_ed25519.pub"
fi

exec $SHELL
