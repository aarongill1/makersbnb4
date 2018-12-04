require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require './app'
<<<<<<< Updated upstream
require 'activerecord'

desc "Migrate the database through scripts in db/migrate."
namespace :db do


	desc "Create the database"
  task :create do
    ActiveRecord::Base.establish_connection(db_config_admin)
    ActiveRecord::Base.connection.create_database(db_config["database"])
    puts "Database created."
  end
  
  task :migrate do
    Rake::Task["db:migrate_db1"].invoke
  end

  task :migrate_db1 do
    ActiveRecord::Base.establish_connection DB1_CONF
    ActiveRecord::Migrator.migrate("db/migrate/db1/")
  end
end

=======
>>>>>>> Stashed changes
