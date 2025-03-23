if ! command -v bun &> /dev/null; then
    echo "bun is not installed"
    curl -fsSL https://bun.sh/install | bash
fi

if ! command -v node &> /dev/null; then
    echo "node is not installed"
    exit 1
fi

if ! command -v npm &> /dev/null; then
    echo "npm is not installed"
    exit 1
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
