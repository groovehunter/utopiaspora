class Profile < ActiveRecord::Base

  
  attr_accessible :first_name, :last_name, :image_url, :image_url_medium,
    :image_url_small, :birthday, :gender, :bio, :location, :searchable, :date
  
  belongs_to :person

end
