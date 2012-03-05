class Person < ActiveRecord::Base
  
  belongs_to :owner, :class_name => 'User'
  
  has_one :profile, :dependent => :destroy

  set_table_name "people"
  
end
