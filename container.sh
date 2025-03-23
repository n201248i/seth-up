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
    exit 1
fi

if ! grep -q "^#n201248i$" .gitignore; then
    printf "\n\n#n201248i\n" >> .gitignore
    printf "node_modules\n" >> .gitignore
    printf "bun.lock\n" >> .gitignore
    printf "*.dev\n" >> .gitignore
    printf "*.data\n" >> .gitignore
fi
