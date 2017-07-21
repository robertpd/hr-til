#!/usr/bin/env bash

#git pull gitlab master

echo "Updating controller letsencrypt action with value ${CERTBOT_VALIDATION}"

sed -i "" -E "s/\"(.*)\"/\"${CERTBOT_VALIDATION}\"/" ../app/controllers/pages_controller.rb

echo "Committing change"

git add ../app/controllers/pages_controller.rb

git commit -m "Updates letsencrypt challenge"

#git push heroku-production master

echo "Change pushed to Heroku. Waiting 5 minutes before continuing..."