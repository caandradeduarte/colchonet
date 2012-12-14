Colchonet::Application.routes.draw do
  scope "(:locale)", :locale => /en|pt\-BR/ do
  	resources :rooms
  	resources :users

  	resource :confirmation, :only => [:show]

  	resource :user_sessions, :only => [:create, :new, :destroy], :path => 'login', :path_names => {:new => ''}
  end

  root :to => 'home#index'
end
