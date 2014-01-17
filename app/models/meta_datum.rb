class MetaDatum < ActiveRecord::Base
  belongs_to :account

  before_create :generate_field_name

  def generate_field_name
    puts self.inspect
    self.field_name = self.human_name.downcase.tr('^A-Za-z0-9', '_')
  end
end
