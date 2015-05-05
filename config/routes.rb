Rails.application.routes.draw do

  root 'home#index'

  get 'forecast/:location' => 'forecast#show'

end
