Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admin/sessions' }, class_name: "Admin::Admin"
  devise_for :workers, controllers: { sessions: 'worker/sessions' }, class_name: "Worker::Worker"

  root 'landing#landing_page'

  namespace :admin do
    root 'profiles#show'
    resource :profile, except: %i[create destroy]
    resources :shipments
  end

  namespace :worker do
    root 'profiles#show'
    resource :profile, except: %i[create destroy]
    resources :shipments
  end
end
