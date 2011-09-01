Rails.application.routes.draw do
  # Add your extension routes here
    namespace :admin do
      resources :products do
        resources :productpage_blocks do
          collection do
            post :update_positions
          end
        end
      end
    end
end
