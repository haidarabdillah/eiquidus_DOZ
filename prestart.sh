#!/bin/bash

# MongoDB Configuration
DB_NAME="explorerdb"
DB_USER="userrpc"
DB_PASS="changeMeplease"

# Update package list
sudo apt update

# Install MongoDB
sudo apt install -y mongodb

# Start MongoDB service
sudo service mongod start

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# Activate NVM (you might need to restart the terminal or run source ~/.bashrc, source ~/.zshrc, etc.)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Install Node.js version 20
nvm install 20
nvm use 20

npm i

# MongoDB setup
mongo <<EOF
use $DB_NAME
db.createUser({
  user: "$DB_USER",
  pwd: "$DB_PASS",
  roles: ["readWrite"]
});
EOF

echo "Database '$DB_NAME' with user '$DB_USER' has been created"
