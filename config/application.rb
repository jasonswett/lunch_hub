require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module LunchHub
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

   config.assets.paths << Rails.root.join('app', 'assets', 'components')

    # via https://github.com/sstephenson/sprockets/issues/347#issuecomment-25543201

    # We don't want the default of everything that isn't js or css, because it pulls too many things in
    config.assets.precompile.shift

    # Explicitly register the extensions we are interested in compiling
    config.assets.precompile.push(Proc.new do |path|
      File.extname(path).in? [
        ".html", ".erb", ".haml",                 # Templates
        ".png",  ".gif", ".jpg", ".jpeg", ".svg", # Images
        ".eot",  ".otf", ".svc", ".woff", ".ttf", # Fonts
      ]
    end)

    initializer :after_append_asset_paths, group: :all, after: :append_assets_path do
       config.assets.paths.unshift Rails.root.join("app", "assets", "components", "jquery-ui", "themes", "base").to_s
    end

    config.active_record.pluralize_table_names = false
  end
end
