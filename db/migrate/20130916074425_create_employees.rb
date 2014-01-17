class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :eid
      t.string :department
      t.string :title

      t.timestamps
    end
  end
end
