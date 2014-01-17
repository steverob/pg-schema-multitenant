desc "Installs HStore Extension into HSTORE Schema"
task hstore_setup: :environment do
  ActiveRecord::Base.connection.execute("CREATE SCHEMA hstore; CREATE EXTENSION HSTORE SCHEMA hstore")
end