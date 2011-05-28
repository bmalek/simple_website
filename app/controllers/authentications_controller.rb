class AuthenticationsController < ApplicationController
  # GET /authentications
  # GET /authentications.xml
  def index
    @authentications = current_user.authentications if current_user
  end

  # GET /authentications/1
  # GET /authentications/1.xml
  #def show
   # @authentication = Authentication.find(params[:id])

    #respond_to do |format|
     # format.html # show.html.erb
      #format.xml  { render :xml => @authentication }
    #end
  #end

  # GET /authentications/new
  # GET /authentications/new.xml
  #def new
   # @authentication = Authentication.new

    #respond_to do |format|
     # format.html # new.html.erb
      #format.xml  { render :xml => @authentication }
    #end
  #end

  # GET /authentications/1/edit
  #def edit
   # @authentication = Authentication.find(params[:id])
  #end

  # POST /authentications
  # POST /authentications.xml
  #def create    
                       
  #end

  # PUT /authentications/1
  # PUT /authentications/1.xml
  #def update
   # @authentication = Authentication.find(params[:id])

    #respond_to do |format|
     # if @authentication.update_attributes(params[:authentication])
      #  format.html { redirect_to(@authentication, :notice => 'Authentication was successfully updated.') }
       # format.xml  { head :ok }
#      else
 #       format.html { render :action => "edit" }
  #      format.xml  { render :xml => @authentication.errors, :status => :unprocessable_entity }
   #   end
    #end
  #end

  # DELETE /authentications/1
  # DELETE /authentications/1.xml
  def destroy
    @authentication = current_user.authentications.find(params[:id])
    # Can only delete if there are other authentications means for the user
    if (current_user.authentications.size > 1 || !current_user.password.blank?)
      @authentication.destroy
      flash[:notice] = "#{@authentication.provider} account is removed successfully"            
    else
      flash[:notice] = "This is the last authentication means and cannot be removed!"            
    end
    redirect_to authentications_url
    
  end
end
