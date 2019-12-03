Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/', to: 'url_shortener#url'

  get '/:short_url', to: 'url_shortener#find_url'
end
