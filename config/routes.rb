Rails.application.routes.draw do
  resources :contacts
  resources :products
  resources :brands
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, param: :_username
  post 'password/forgot', to: 'passwords#forgot'

  post 'password/reset', to: 'passwords#reset'

  post '/auth/login', to: 'authentication#login'

  get "user_products" => "products#user_products"

  get "product_list" => "products#product_list"

  post "product_update" => "products#product_update"

  post "product_delete" => "products#product_delete"

  get "brand_list" => "brands#brand_list"

  post "brand_update" => "brands#brand_update"

  post "brand_delete" => "brands#brand_delete"

  get "contact_list" => "contacts#contact_list"

  get "find_contact" => "contacts#find_contact"

  post "contact_update" => "contacts#contact_update"

  post "contact_delete" => "contacts#contact_delete"

end
