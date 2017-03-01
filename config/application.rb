require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CatOrNot
  class Application < Rails::Application

    config.generators do |g|
      g.test_framework :minitest, spec: false
    end

    config.paperclip_defaults = {storage: :fog,
                                 fog_directory: "catornotphotos",
                                 fog_credentials: {provider: "google",
                                                   google_storage_access_key_id: Rails.application.secrets.google_storage_access_key_id,
                                                   google_storage_secret_access_key: Rails.application.secrets.google_storage_secret_access_key}}


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
