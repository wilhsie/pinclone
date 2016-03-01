# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

SampleApp::Application.configure do
  # Disable Rails's static asset server (Apache or nginx will already do this)  
  config.serve_static_assets = false

  # Compress JavaScripts and CSS  
  config.assets.compress = true

  # Don't fallback to assets pipeline if a precompiled asset is missed  
  config.assets.compile = false

  # Generate digests for assets URLs  
  config.assets.digest = true
end
