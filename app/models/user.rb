class User < ActiveRecord::Base
  
  has_many :authentications
  has_many :assignments
  has_many :roles, :through => :assignments
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :timeoutable, :omniauthable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :password, :password_confirmation, :remember_me
  
  def apply_omniauth(omniauth)
    provider_email = omniauth['user_info']['email']
    username = omniauth['user_info']['nickname']
    self.email = provider_email if email.blank?
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'], :provider_email => provider_email, :username => username)
  end        
  
  def password_required?
    (authentications.empty? || !password.blank?) && super
  end 
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.omniauth_data"] 
        user.apply_omniauth(data)
      end
    end
  end
  
  # required for declarative_authorization
  # roles has a TITLE field
  def role_symbols
     (roles || []).map {|r| r.title.to_sym}
   end
  
end
