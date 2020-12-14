Rails.application.routes.draw do
  resources :batters, except: :destroy
  resources :pitchers, except: :destroy
  resources :plate_appearances, except: :destroy
  get '/main', to: 'plate_appearances#main', as: 'main'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
