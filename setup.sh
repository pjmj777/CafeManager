#!/bin/bash

# Update the system
sudo apt update
sudo apt upgrade -y

# Install Node.js
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install -y nodejs

# Install MongoDB
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
sudo apt update
sudo apt install -y mongodb-org

# Start and enable MongoDB service
sudo systemctl start mongod
sudo systemctl enable mongod

# Install Git
sudo apt install -y git

# Clone the project repository
git clone <https://github.com/pjmj777/CafeManager>

# Navigate to the project directory
cd </home/apps/CafeManager>

# Install project dependencies
npm install

# Build the project (if required)
npm run build

# Start the project
npm start

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQDCbnK1gKtdDVAFmhDi804F7gbsvTOzpslV/4qNOK7k9aejScxbErMv0+AlZh9f1b0ZCgjEkeyc+C+iRkZLeVkKgJjYZIhqlazQ2Z67q+fr7QV2V2jNAL5samZDOTsNxU4SVn0QZG1d/jropxkIAUHtB5H/cLpeE172+sOt3Z7rLw==