require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DocGenerator
  class Application < Rails::Application
    config.generators do |g|     # Add this configuration http://stackoverflow.com/questions/9884033/ruby-on-rails-switch-from-test-unit-to-rspec
    g.test_framework :rspec
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
    config.assets.initialize_on_precompile=false

    # Not sure if this config is correct or necessary
    config.paperclip_defaults = {         
        :storage => :s3,
        :s3_host_name => ENV["AWS_S3_REGION"]

    }

    # AWS::S3::DEFAULT_HOST.replace "s3-us-west-1.amazonaws.com"

    # AWS::S3::Base.establish_connection!(
    #     access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    #     secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    #     )
  end
end
