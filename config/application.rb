require_relative 'boot'

require 'rails/all'
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Supprecover
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
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
      gamma_gtp: { min: 25, middle: 50, max: 75 },
      fasting_blood_sugar: { min: 70, middle: 85, max: 100 },
      hba1c: { min: 4.5, middle: 5.0, max: 5.5 },
      urine_sugar: { min: 0, middle: 1, max: 2 },
      uric_acid: { min: 2.0, middle: 4.5, max: 7.0 },
      creatinine: { min: 0.5, middle: 0.6, max: 0.7 },
      egfr: { min: 60, middle: 75, max: 90 },
      hematocrit: { min: 36, middle: 40, max: 44 },
      hemoglobin: { min: 13, middle: 14, max: 16 },
      rbc: { min: 360, middle: 425, max: 490 },
      wbc: { min: 3100, middle: 5700, max: 8400 },
      urine_protein: { min: 0, middle: 0, max: 1 }
    }
  end
end
