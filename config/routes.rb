Grohan::Application.routes.draw do     

  devise_for :users

  resources :deals    
  match 'deals/:id/publish' => 'deals#publish', :as => :publish
  
  root :to => "deals#index"
  
end
