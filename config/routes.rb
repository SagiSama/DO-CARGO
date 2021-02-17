Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admin/sessions' }, class_name: "Admin::Admin"
  devise_for :workers, controllers: { sessions: 'worker/sessions' }, class_name: "Worker::Worker"

  root 'landing#landing_page'

  namespace :admin do
    root 'dashboards#index'
    resources :dashboards, only: :index
    resource :profile, except: %i[create destroy]
    resources :shipments
    resources :workers
  end

  namespace :worker do
    root 'dashboards#index'
    resources :dashboards, only: :index
    resource :profile, except: %i[new create destroy]
    resources :shipments
  end
end
