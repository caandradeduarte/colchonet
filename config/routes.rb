Colchonet::Application.routes.draw do
  scope "(:locale)", :locale => /en|pt\-BR/ do
  	resources :rooms
  	resources :users

  	resource :confirmation, :only => [:show]
  end

  root :to => 'home#index'
end
