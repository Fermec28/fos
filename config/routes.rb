Rails.application.routes.draw do
  root 'questions#index'

  concern :votable do
    put    'vote' => :vote,   on: :member
    delete 'vote' => :unvote, on: :member
  end

  resources :questions, only: [:index, :new, :create, :show], concerns: :votable do
    resources :answers, only: [:create], concerns: :votable
  end

  devise_for :users
end
