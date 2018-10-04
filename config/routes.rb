Rails.application.routes.draw do

  root 'movie_lists#index'
  
  get '/movie_lists/current', controller: :movie_lists, action: :current, default: { format: :josn }
  resources :movie_lists

  resources :movies do
    collection do
      post :get_details
      get :confirm_details
      get :select_movie
    end
  end
end
