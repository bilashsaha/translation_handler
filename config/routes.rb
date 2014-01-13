Rails.application.routes.draw do
  namespace :translation_handler do
    resources :translations, :constraints => { :id => /.*/ }
  end
end
