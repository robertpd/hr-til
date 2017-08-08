#!/usr/bin/env bash

sudo heroku certs:update /etc/letsencrypt/live/til-engineering.nulogy.com/fullchain.pem /etc/letsencrypt/live/til-engineering.nulogy.com/privkey.pem --app nulogytil
echo "SSL certificate will be updated after approximately 5 minutes"
