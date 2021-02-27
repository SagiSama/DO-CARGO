Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admin/sessions' }, class_name: "Admin::Admin"
  devise_for :workers, controllers: { sessions: 'worker/sessions', passwords: 'worker/passwords' }, class_name: "Worker::Worker"

  root 'landing#landing_page'
  namespace :landing do
    post :track_shipment
  end

  namespace :admin do
    root 'dashboards#index'
    resources :dashboards, only: :index
    resource :profile, except: %i[create destroy]
    resources :shipments
    resources :workers
    resources :posts
  end

  namespace :worker do
    root 'dashboards#index'
    resources :dashboards, only: :index
    resource :profile, except: %i[new create destroy]
    resources :shipments do
      collection do
        post :state_shipment
      end
    end
    resources :payments, except: :show do
      collection do
        post :shipment_payment
      end
      member do
        delete :shipment_payment_delete
      end
    end
  end
end
