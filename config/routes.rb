Rails.application.routes.draw do
  root to: "home#index"

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :contacts
  devise_for :users, controllers: {
                       sessions: "users/sessions",
                     }
end
