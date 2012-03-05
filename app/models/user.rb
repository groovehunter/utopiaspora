class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_one :person, :foreign_key => :owner_id
  delegate :public_key, :diaspora_handle, :name, :profile, 
            :first_name, :last_name, :to => :person


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, 
                  :password, 
                  :password_confirmation,
                  :username
  
  
  
  def encryption_key
    OpenSSL::PKey::RSA.new(serialized_private_key)
  end

end
