LiquidCms::Engine.routes.draw do
  get "t/:slug", :to => "pages#display" 
  resources :pages
  resources :text_blocks
end
