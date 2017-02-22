require_relative "boot"

require "rails/all"

require "csv"

Bundler.require(*Rails.groups)

module LibManager
  class Application < Rails::Application
  end
end
