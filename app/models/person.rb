class Person < ActiveRecord::Base
  
  belongs_to :owner, :class_name => 'User'

  set_table_name "people"
  
end
