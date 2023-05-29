#!/bin/bash

# Update package manager
sudo apt update

# Install essential dependencies
sudo apt install -y build-essential libssl-dev

# Install Node.js using Node Version Manager (nvm)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
source ~/.bashrc
nvm install node

# Install MongoDB
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu $(lsb_release -sc)/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
sudo apt update
sudo apt install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod

# Install Git
sudo apt install -y git

cd /home
mkdir apps
cd apps

# Clone your MERN app repository (replace REPO_URL with your repository URL)
git clone https://github.com/pjmj777/CafeManager/

# Navigate to the app directory
cd /home/apps/CafeManager

# Install backend dependencies
cd backend
npm install

# Install frontend dependencies
cd ../frontend
npm install

# Build the frontend
npm run build

# Start the app
cd ../backend
npm start
