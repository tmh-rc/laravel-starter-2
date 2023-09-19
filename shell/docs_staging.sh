#!/bin/sh

# Change project directory
echo "Change project directory document"
cd document || exit

# Git pull
echo "Git pull"
git pull origin develop

# Install dependencies
echo "Install dependencies"
npm install

# Build node dependencies
echo "Build node dependencies"
npm run docs:build