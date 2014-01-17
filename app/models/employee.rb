class Employee < ActiveRecord::Base
  belongs_to :account
  has_one :employee_detail

  accepts_nested_attributes_for :employee_detail
end
