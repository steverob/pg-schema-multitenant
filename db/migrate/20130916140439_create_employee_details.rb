class CreateEmployeeDetails < ActiveRecord::Migration
  def change
    create_table :employee_details do |t|
      t.integer :employee_id
      t.hstore :details

      t.timestamps
    end
  end
end
