# frozen_string_literal: true

require 'pry'
require_relative './system/application'

Application.start(:database)
Application.start(:logger)

Application['database'].loggers << Application['logger']

migrate =
  lambda do |version|
    Sequel.extension(:migration)
    Sequel::Migrator.apply(Application['database'], 'db/migrate', version)

    Rake::Task['db:dump'].invoke
  end

namespace :db do
  desc 'Migrate the database'
  task :migrate do
    migrate.call(nil)
  end

  desc 'Rolling back latest migration.'
  task :rollback do |_, _args|
    current_version = Application['database'].fetch('SELECT * FROM schema_info').first[:version]

    migrate.call(current_version - 1)
  end

  desc 'Dump database schema to file.'
  task :dump do
    development = Application.env == 'development'

    if development
      sh %(pg_dump --schema-only --no-privileges --no-owner -s #{Application['database'].url} > db/structure.sql)
    end
  end

  desc 'Seed database with test data.'
  task :seed do
    sh %(ruby db/seeds.rb)
  end
end

desc 'Create Yard Docs'
task :docs do
  sh %(yard doc *.rb app/ lib/)
end
