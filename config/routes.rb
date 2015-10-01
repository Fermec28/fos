Rails.application.routes.draw do
  root 'questions#index'

  concern :votable do
    put    'vote' => :vote,   on: :member
    delete 'unvote' => :unvote, on: :member
  end

  resources :questions, only: [:index, :new, :create, :show], concerns: :votable do
    resources :comments, module: :questions

    resources :answers, only: [:create], concerns: :votable do
      resources :comments, module: :answers
    end
  end

  devise_for :users
end
