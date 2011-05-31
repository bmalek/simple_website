class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def handle_unverified_request
    true
  end
  
  def facebook
    # You need to implement the method below in your model        
    omniauth = env["omniauth.auth"] # removed request.env         
    
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if authentication
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect authentication.user, :event => :authentication
    elsif current_user
      provider_email = omniauth['user_info']['email']
      username = omniauth['user_info']['nickname']
      current_user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'], :provider_email => provider_email, :username => username)
      flash[:notice] = "Authentication added successfully."
      redirect_to authentications_url
    else
      user = User.new
      user.apply_omniauth(omniauth)
      if user.save
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
        sign_in_and_redirect user, :event => :authentication
      else
        session['devise.omniauth_data'] = omniauth.except('extra')
        redirect_to new_user_registration_url
      end
    end
    
    
  end
   
  def twitter                     
    
    # You need to implement the method below in your model        
    omniauth = env["omniauth.auth"] # removed request.env         
    
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if authentication
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Twitter"
      sign_in_and_redirect authentication.user, :event => :authentication
    elsif current_user
      provider_email = omniauth['user_info']['email']
      username = omniauth['user_info']['nickname']
      current_user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'], :provider_email => provider_email, :username => username)
      flash[:notice] = "Authentication added successfully."
      redirect_to authentications_url
    else
      user = User.new
      user.apply_omniauth(omniauth)
      if user.save
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Twitter"
        sign_in_and_redirect user, :event => :authentication
      else
        session['devise.omniauth_data'] = omniauth.except('extra')
        redirect_to new_user_registration_url
      end
    end
    
  end
  
  def google_apps
    
    # You need to implement the method below in your model        
    omniauth = env["omniauth.auth"] # removed request.env         
    
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if authentication
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google_Apps"
      sign_in_and_redirect authentication.user, :event => :authentication
    elsif current_user
      provider_email = omniauth['user_info']['email']
      username = omniauth['user_info']['nickname']
      current_user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'], :provider_email => provider_email, :username => username)
      flash[:notice] = "Authentication added successfully."
      redirect_to authentications_url
    else
      user = User.new
      user.apply_omniauth(omniauth)
      if user.save
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google_Apps"
        sign_in_and_redirect user, :event => :authentication
      else
        session['devise.omniauth_data'] = omniauth.except('extra')
        redirect_to new_user_registration_url
      end
    end
    
  end
      
  
end