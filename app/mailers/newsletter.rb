class Newsletter < ActionMailer::Base
  #default :from => "from@example.com"
  default :from => "ordib.iran@gmail.com"
  
  def daily(user, deal)
    @deal = deal 
    @user = user
    # This has to be returned last
    mail(:to => "ordib's subscriber <#{@user.email}>", :subject => "#{@deal.title}")   
    
  end
end
