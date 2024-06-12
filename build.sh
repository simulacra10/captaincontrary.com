#!/bin/sh
echo "Starting the build process..."

emacs -Q --script buildsite.el


echo "Build process complete."

# Function to prompt the user for a commit message and confirmation
commit_to_git() {
    while true; do
        read -p "Do you want to commit to git? (yes/no): " commit_answer
        if [ "$commit_answer" = "yes" ]; then
            while true; do
                read -p "Enter your commit message: " commit_message
                read -p "Your commit message is: '$commit_message'. Confirm? (yes/no): " confirm_commit
                if [ "$confirm_commit" = "yes" ]; then
                    git add .
                    git commit -m "$commit_message"
                    echo "Changes committed to git."
                    git push origin master
                    echo "Changes pushed to origin master."
                    return 0
                else
                    echo "Let's try entering the commit message again."
                fi
            done
        elif [ "$commit_answer" = "no" ]; then
            echo "Skipping git commit."
            return 1
        else
            echo "Please answer yes or no."
        fi
    done
}

# Prompt for git commit
commit_to_git

# Function to prompt the user for deploying the site
deploy_site() {
    while true; do
        read -p "Do you want to deploy the site? (yes/no): " deploy_answer
        if [ "$deploy_answer" = "yes" ]; then
            scp -r ./public/. root@172.104.28.210:/var/www/captaincontrary.com
            echo "Deployment complete."
            return 0
        elif [ "$deploy_answer" = "no" ]; then
            echo "Skipping deployment."
            return 1
        else
            echo "Please answer yes or no."
        fi
    done
}

# Prompt for deploying the site
deploy_site

echo "Script execution finished."
