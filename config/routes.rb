Rails.application.routes.draw do
  resources :cocktails do
    resources :doses, only: [:new, :create, :show]
  end
  delete "doses/:id", to: "doses#destroy", as: 'dose_delete'
end
