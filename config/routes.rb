Rails.application.routes.draw do
  scope module: :web do
    namespace :articles do
      resources :categories
    end

    resources :articles do
      scope module: :articles do
        resources :comments, only: %i[create destroy]
      end
    end

    root 'welcome#index'
  end
end
