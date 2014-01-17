class Account < ActiveRecord::Base
  has_many :users
  has_many :employees
  validates_uniqueness_of :uid
  after_create :prepare_account
  before_destroy :delete_schema

  has_many :meta_data


  private

  def prepare_account
    create_schema
    load_tables
  end

  def create_schema
    PgTools.create_schema id unless PgTools.schemas.include? id.to_s
  end

  def delete_schema
    PgTools.drop_schema id
  end

  def load_tables
    return if Rails.env.test?
    PgTools.set_search_path id, false
    load "#{Rails.root}/db/schema.rb"
    SHARED_TABLES.each { |name| self.class.connection.execute %{drop table "#{name}"} }
    PgTools.restore_default_search_path
  end


end
