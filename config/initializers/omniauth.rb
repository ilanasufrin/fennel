OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["google_oauth2_client"], ENV["google_oauth2_secret"], {
    scope: "email,profile",
    image_aspect_ratio: "square"
  }
end
