# frozen_string_literal: true

Application.boot(:database) do |container|
  use :environment_variables

  init do
    require 'sequel/core'
  end

  start do
    database = Sequel.connect(ENV.delete('DATABASE_URL'))
    container.register(:database, database)
  end
end
