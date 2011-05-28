class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def facebook
    # You need to implement the method below in your model        
    omniauth = env["omniauth.auth"] # removed request.env   
    user = User.is_there_omniauth?(omniauth, current_user)        
    if user
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect user, :event => :authentication
    else
      user = User.new
      user.apply_omniauth(omniauth)      
      if user.save
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
        sign_in_and_redirect user, :event => :authentication
      else 
        session['devise.omniauth_data'] = omniauth.except('extra')
        flash[:notice] = I18n.t "devise.omniauth_callbacks.failure", :kind => "Facebook"
        #session["devise.twitter_data"] = env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end    
  end
   
  def twitter                     
    
    omniauth = env["omniauth.auth"] # removed request.env   
    user = User.is_there_omniauth?(omniauth, current_user)        
    if user
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Twitter"
      sign_in_and_redirect user, :event => :authentication
    else
      user = User.new
      user.apply_omniauth(omniauth)      
      if user.save
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Twitter"
        sign_in_and_redirect user, :event => :authentication
      else 
        session['devise.omniauth_data'] = omniauth.except('extra')
        flash[:notice] = I18n.t "devise.omniauth_callbacks.failure", :kind => "Twitter"
        #session["devise.twitter_data"] = env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end
  end
  
  def google_apps
    
    omniauth = env["omniauth.auth"] # removed request.env   
    user = User.is_there_omniauth?(omniauth, current_user)        
    if user
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google_Apps"
      sign_in_and_redirect user, :event => :authentication
    else
      user = User.new
      user.apply_omniauth(omniauth)      
      if user.save
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google_Apps"
        sign_in_and_redirect user, :event => :authentication
      else 
        session['devise.omniauth_data'] = omniauth.except('extra')
        flash[:notice] = I18n.t "devise.omniauth_callbacks.failure", :kind => "Google_Apps"
        #session["devise.twitter_data"] = env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end
  end    
  
end