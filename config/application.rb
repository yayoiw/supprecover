require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Supprecover
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.x.reference_values = {
      blood_pressure_up: { min: 90, middle: 120, max: 140 },
      blood_pressure_down: { min: 60, middle: 80, max: 90 },
      total_cholesterol: { min: 140, middle: 180, max: 220 },
      hdl_cholesterol: { min: 40, middle: 55, max: 70 },
      ldl_cholesterol: { min: 60, middle: 90, max: 120 },
      neutral_fat: { min: 50, middle: 100, max: 150 },
      ast: { min: 10, middle: 20, max: 30 },
      alt: { min: 10, middle: 20, max: 30 },
      gamma_gtp: { min: 25, middle: 50, max: 75 }
    }
  end
end
