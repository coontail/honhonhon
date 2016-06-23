require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Drunkmoliere

  class Application < Rails::Application

    config.active_record.raise_in_transactional_callbacks = true

    config.autoload_paths += %W(
      #{config.root}/app/jobs/*/*
      #{config.root}/lib/extensions
      #{config.root}/lib/errors
    )

  end

end
