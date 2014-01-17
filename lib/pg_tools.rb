module PgTools
  extend self

  def search_path
    ActiveRecord::Base.connection.schema_search_path
  end

  def default_search_path
    @default_search_path ||= %{"$user", public, hstore}
  end

  def set_search_path(name, include_public = true)
    path_parts = ["account_#{name.to_s},hstore", ("public" if include_public)].compact
    ActiveRecord::Base.connection.schema_search_path = path_parts.join(",")
  end

  def restore_default_search_path
    ActiveRecord::Base.connection.schema_search_path = default_search_path
  end

  def create_schema(name)
    sql = %{CREATE SCHEMA "account_#{name}"}
    ActiveRecord::Base.connection.execute sql
  end

  def drop_schema(name)
    sql = %{DROP SCHEMA "account_#{name}"}
    ActiveRecord::Base.connection.execute sql
  end

  def schemas
    sql = "SELECT nspname FROM pg_namespace WHERE nspname !~ '^pg_.*'"
    ActiveRecord::Base.connection.query(sql).flatten
  end

  def private_search_path?
    !search_path.match /public/
  end
end