# Create .vscode folder if it does not exist
if [ ! -d ".vscode" ]; then
    echo ".vscode folder does not exist, creating one"
    mkdir .vscode
fi

# Initialize a new package.json file if it does not exist
if [ ! -f "package.json" ]; then
    echo "package.json does not exist, initializing one"
    bun init -y
fi

bun add -d eslint @eslint/js
bun add -d @types/node

# Download settings.json and force overwrite if it exists
curl -fsSL https://raw.githubusercontent.com/n201248i/seth-up/refs/heads/main/.vscode/settings.json -o .vscode/settings.json

# Download tsconfig.json and force overwrite if it exists
curl -fsSL https://raw.githubusercontent.com/n201248i/seth-up/refs/heads/main/tsconfig.json -o tsconfig.json

# Download eslint.config.js and force overwrite if it exists
curl -fsSL https://raw.githubusercontent.com/n201248i/seth-up/refs/heads/main/eslint.config.js -o eslint.config.js

# Download .gitignore and force overwrite if it exists
curl -fsSL https://raw.githubusercontent.com/n201248i/seth-up/refs/heads/main/.gitignore -o .gitignore

