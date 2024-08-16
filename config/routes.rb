Rails.application.routes.draw do    
  get 'treino_treinadors/index'
  #get 'login_treinador/access'  
  resources :exercicios
  resources :enderecos
  resources :treino_clientes
  resources :clientes
  resources :treinos
  resources :operadors, except: [:index]
  get '/treinador/login', to: 'login_treinador#signin'
  post '/treinador/login', to: 'login_treinador#access', as: :login_treinador
  
  scope :admin do
    get '/', to: 'administrador#index'
    resources :operadors
  end 

  resources :treinadors, except: [:index] do
    get '/', to: 'treinadors#show'
    get '/treinos', to: 'treino_treinadors#index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
