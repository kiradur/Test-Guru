Rails.application.routes.draw do

  root to: 'tests#index'

  devise_for :users,
             path: :gurus,
             path_names: { sign_in: :login, sign_out: :logout },
             controllers: { sessions: 'sessions'}

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :feedbacks, only: %i[new create]

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      
      resources :questions, except: :index, shallow: true do
        resources :answers, except: :index, shallow: true
      end
    end

    resources :gists, only: :index
  end

end
