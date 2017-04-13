Rails.application.routes.draw do
  get 'items_management/index'

#  get 'front_page/index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#  root 'front_page#index'
  
  
  get "admin",              to: "admin#index"
  namespace :admin do
    get "index",            to: "index"
    resources :users, :categories, :item_templates
    resources :categories do
      resources :item_templates
    end
  end

  get "items_management",  to: "items_management/items#index"
  namespace :items_management do
    get "index",            to: "index"
    post "update_new_form", to: "items#update_new_form"
    resources :items
    resources :categories do
      resources :items
    end
  end

  namespace :shop do
    get "/",                                to: "items#index"
    get "/items",                           to: "items#index"
    get "/items/:id",                       to: "items#index", as: "item"
    get "/categories/:category_id/items",   to: "items#index", as: "category_items"
  end
  
  
  
end
