class PagesController < ApplicationController
  def letsencrypt
    render text: "${CERTBOT_VALIDATION}"
  end
end
