class UserMailer < ActionMailer::Base
  default :from => "ordib.iran@gmail.com"
  
  #registration confirmation email method
  def registration_confirmation(user)
    @user = user
    
    attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    
    # This has to be returned last
    mail(:to => "ordib's visitor <#{user.email}>", :subject => "Registered")
  end    
  
end
