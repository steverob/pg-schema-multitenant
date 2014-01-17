class AddHumanNameToMetaData < ActiveRecord::Migration
  def change
    add_column :meta_data, :human_name, :string
  end
end
