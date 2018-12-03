require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require './app'

desc "Migrate the database through scripts in db/migrate."
namespace :db do
  task :migrate do
    Rake::Task["db:migrate_db1"].invoke
    Rake::Task["db:migrate_db2"].invoke
  end

  task :productoion_db do
    ActiveRecord::Base.establish_connection DB1_CONF
    ActiveRecord::Migrator.migrate("db/migrate/db1/")
  end

  task :migrate_db2 do
    ActiveRecord::Base.establish_connection DB2_CONF
    ActiveRecord::Migrator.migrate("db/migrate/db2/")
  end
end