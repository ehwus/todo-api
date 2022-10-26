# frozen_string_literal: true

Application.boot(:active_support) do
  init do
    require 'active_support/message_verifier'
    require 'active_support/json'
  end

  start do
    ActiveSupport::JSON::Encoding.time_precision = 0
  end
end
