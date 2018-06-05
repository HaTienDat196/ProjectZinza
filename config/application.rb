require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)

module Project
  class Application < Rails::Application
    config.load_defaults 5.1
  end
end

module Master
  class Application < Rails::Application
    config.i18n.default_locale = :en
  end
end
