#!/usr/bin/env bash

echo "This script will get a challenge key from certbot, commit it to the codebase, push to heroku and gitlab."
echo "Certbot will then verify the challenge, and store the new SSL certificate on your computer."
echo "You will need the following to begin:"
echo "  - Clean working directory"
echo "  - 'gitlab' remote"
echo "  - 'heroku-production' remote"
echo "  - Heroku collaborator access for the nulogytil app (can be provided by Infra)"
read -p "If you meet the above conditions, you can continue.  Continue? (y/n) " answer
case ${answer:0:1} in
    y|Y )
      git checkout master

      read -p 'Email address to use for cert renewal: ' email

      brew install certbot

      echo "If prompted below for password, enter your the password for your Nulogy account/Mac OS login."

      sudo certbot certonly --agree-tos --manual --manual-public-ip-logging-ok --manual-auth-hook ./script/renew_cert_manual_auth_hook.sh --manual-cleanup-hook ./script/renew_cert_manual_cleanup_hook.sh --non-interactive --logs-dir ./log/ --domain til-engineering.nulogy.com --email $email
    ;;
    * )
        echo "Exiting"
    ;;
esac
