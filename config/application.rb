#
# Copyright 2017 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
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
