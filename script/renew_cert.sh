#!/usr/bin/env bash

#git checkout master

read -p 'Email address to use for cert renewal: ' email

brew install certbot

echo "When prompted below for password, enter your the password for your Nulogy account/Mac OS login."

sudo certbot certonly --agree-tos --manual --non-interactive --logs-dir ../log/ --domain til-engineering.nulogy.com --email $email --manual-public-ip-logging-ok --manual-auth-hook ./renew_cert_manual_auth_hook.sh --manual-cleanup-hook ./renew_cert_manual_cleanup_hook.sh