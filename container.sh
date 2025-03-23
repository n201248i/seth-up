apt update

if ! command -v bun &> /dev/null; then
    echo "bun is not installed"
    curl -fsSL https://bun.sh/install | bash
fi

if ! command -v node &> /dev/null; then
    echo "node is not installed"
    # Download and install nvm:
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
    # in lieu of restarting the shell
    \. "$HOME/.nvm/nvm.sh"
    # Download and install Node.js:
    nvm install 22
    # Verify the Node.js version:
    node -v # Should print "v22.14.0".
    nvm current # Should print "v22.14.0".
    # Verify npm version:
    npm -v # Should print "10.9.2".
fi

if ! command -v git &> /dev/null; then
    echo "git is not installed"
    sudo apt install git
fi

# Check if SSH ED25519 key exists, if not, generate one
if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
    echo "SSH ED25519 key does not exist, generating one"
    ssh-keygen -t ed25519 -f "$HOME/.ssh/id_ed25519" -N ""
    echo "Here is the public part of the SSH ED25519 key:"
    cat "$HOME/.ssh/id_ed25519.pub"
fi
