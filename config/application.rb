require File.expand_path('../boot', __FILE__)

require 'rails/all'
require File.expand_path('../../lib/assets_list', __FILE__)

Bundler.require(*Rails.groups)

module HonHonHon

  class Application < Rails::Application

    config.active_record.raise_in_transactional_callbacks = true

    config.autoload_paths += %W(
      #{config.root}/app/jobs/concerns
      #{config.root}/lib/extensions
      #{config.root}/lib/errors
    )

    config.assets.precompile += CSS_ASSETS_LIST
  end

end
