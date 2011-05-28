class Authentication < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :provider, :uid, :provider_email, :username
end
