class CreateMetaData < ActiveRecord::Migration
  def change
    create_table :meta_data do |t|
      t.string :table_name
      t.string :field_name
      t.string :account_id

      t.timestamps
    end
  end
end
