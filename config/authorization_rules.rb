authorization do
  

  role :guest do 
    has_permission_on :deals, :to => :read
    has_permission_on :users, :to => :create
    has_permission_on :authorization_rules, :to => :read
    has_permission_on :authorization_usages, :to => :read
  end
  
  role :user do
    includes :guest    
  end    
  
  role :admin do
    has_permission_on [:deals, :users, :roles, :assignments], :to => :manage
    has_permission_on :deals, :to => :publish
    has_permission_on :authorization_rules, :to => :read
    has_permission_on :authorization_usages, :to => :read
  end
  
end
 

privileges do
  privilege :manage, :includes => [:create, :read, :update, :delete]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end