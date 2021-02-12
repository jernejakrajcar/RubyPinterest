Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['client_id'], ENV['client_secret']  #, provider_ignores_state: true
end

# Omniauth.establish_connection!(
#   :google_client_id => ENV['client_id']
#   :google_client_secret => ENV['client_secret']
# )
