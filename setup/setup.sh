#!/bin/bash

# Update the system
sudo apt update
sudo apt upgrade -y

# Install Node.js
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install -y nodejs

# Install MongoDB dependencies
sudo apt install -y libcurl4 openssl

# Download MongoDB package
wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-ubuntu2004-5.0.3.tgz

# Extract and install MongoDB
tar -zxvf mongodb-linux-x86_64-ubuntu2004-5.0.3.tgz
sudo mv mongodb-linux-x86_64-ubuntu2004-5.0.3/bin/* /usr/local/bin/
rm -rf mongodb-linux-x86_64-ubuntu2004-5.0.3 mongodb-linux-x86_64-ubuntu2004-5.0.3.tgz

# Create MongoDB data directory
sudo mkdir -p /data/db

# Start MongoDB service
sudo mongod &

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

