require 'roda'

require_relative './system/boot'

class App < Roda
  # Handle different execution envs (prod/dev/test)
  plugin :environments
  # Respond to heartbeat requests
  plugin :heartbeat

  configure :development, :production do
    plugin :enhanced_logger
  end

  # Custom regexps to use for specific symbols.
  plugin :symbol_matchers

  # Auto error handling
  plugin :error_handler

  # Allows modifying the default headers for responses.
  plugin :default_headers,
         'Content-Type' => 'application/json',
         'Strict-Transport-Security' => 'max-age=16070400;',
         'X-Frame-Options' => 'deny',
         'X-Content-Type-Options' => 'nosniff',
         'X-XSS-Protection' => '1; mode=block'

  #  Add request routing methods for all http verbs
  plugin :all_verbs
end