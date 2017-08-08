#!/usr/bin/env bash

echo "**You will need heroku collaborator access for this (at least for the nulogytil app).  If you don't have it, ask infra.**"

echo "Steps to complete process:"
echo "sudo heroku certs:update /etc/letsencrypt/live/til-engineering.nulogy.com/fullchain.pem /etc/letsencrypt/live/til-engineering.nulogy.com/privkey.pem --app nulogytil"
echo "Confirm action when prompted"
echo "SSL certificate will be updated after approximately 5 minutes"
