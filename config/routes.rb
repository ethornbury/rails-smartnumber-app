Rails.application.routes.draw do
  resources :evens
  root to: 'evens#new'
  #get '/check' =>'evens#checkNumberEven'
  
  get '/check',     :controller=>'evens',   :action=>'checkNumberEven'
  post '/validate', :controller=>'evens',   :action=>'isNumberEven'
  
end
