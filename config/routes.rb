Rails.application.routes.draw do
  # noinspection RailsParamDefResolve
  resources :bookstores, only: [] do
    resources :books, only: [] do
      collection do
        get :select_by_publisher
        get :sold
      end
    end
  end
end
