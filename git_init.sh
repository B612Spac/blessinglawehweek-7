#!/usr/bin/env bash

#Expose credentials or secret variables
if [[ ! -f ".env" ]]; then
    echo "File: .env does not exist. Please create .env and add all required variables"
    exit 1
fi

#Source variables from the .env file
 # source .env

#Git config: Check if your system has git configured globally
if git config --global --list >/dev/null 2>&1; then
    echo "Git has been configured globally"
    #git config --global-- list 
else
    git config --global user.name "$USERNAME"
    git config --global user.email "$EMAIL"
fi


#Initialize git only once
if [ ! -d ".git" ]; then
    git init -b main
    git remote add origin https://"${GIT_TOKEN}"@github.com/"${USERNAME}"/"${REPO}".git
else
    echo "Git repository already initialized."
fi

#Create initial files and push to remote repository
init_files=('.gitignore' 'README.md')

for f in "${init_files[@]}"; do
    echo "Creating file: $f"
    touch "$f"
    git add "$f"
done

#Check git status
git status

#Input initial commit message
read -r -p "Enter commit message: " Message
git commit -m "${Message}"
git push -u origin main
