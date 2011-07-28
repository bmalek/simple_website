class User < ActiveRecord::Base
  
  has_many :authentications
  has_many :assignments
  has_many :roles, :through => :assignments
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :timeoutable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :password, :password_confirmation, :remember_me   
  
  # required for declarative_authorization
  # roles has a TITLE field
  def role_symbols
     (roles || []).map {|r| r.title.to_sym}
   end
  
end
