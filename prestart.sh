#!/bin/bash

# MongoDB Configuration
DB_NAME="explorerdb"
DB_USER="userrpc"
DB_PASS="changeMeplease"

# Import MongoDB GPG Key
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -

# Add MongoDB Repository
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list

# Update package list
sudo apt update

# Install MongoDB
sudo apt-get install -y mongodb-org

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
