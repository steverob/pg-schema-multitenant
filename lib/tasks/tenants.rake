namespace :tenants do
  namespace :db do
    desc "runs db:migrate on each account's private schema"
    task migrate: :environment do
      verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
      ActiveRecord::Migration.verbose = verbose

      Account.all.each do |account|
        puts "migrating account #{account.id} (#{account.uid})"
        PgTools.set_search_path account.id, false
        version = ENV["VERSION"] ? ENV["VERSION"].to_i : nil
        ActiveRecord::Migrator.migrate("db/migrate/", version)
      end
    end

    desc "runs db:rollback on each account's private schema"
    task rollback: :environment do
      verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
      ActiveRecord::Migration.verbose = verbose

      Account.all.each do |account|
        puts "rollback for account #{account.id} (#{account.uid})"
        PgTools.set_search_path account.id, false
        steps = ENV["STEPS"] ? ENV["STEPS"].to_i : 1
        ActiveRecord::Migrator.rollback("db/migrate/", steps)
      end
    end
  end
end