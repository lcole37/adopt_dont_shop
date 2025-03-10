Rails.application.routes.draw do
  get '/', to: 'application#welcome'

  get '/admin/shelters', to: 'shelters#admin'
  get '/admin/applicants/:id', to: 'applicants#admin'

  get '/applicants/new', to: 'applicants#new'
  get '/applicants/:id', to: 'applicants#show'
  post '/applicants/', to: 'applicants#create'
  patch 'applicants/:id', to: 'applicants#update'

  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  get '/shelters/:id', to: 'shelters#show'
  post '/shelters', to: 'shelters#create'
  get '/shelters/:id/edit', to: 'shelters#edit'
  patch '/shelters/:id', to: 'shelters#update'
  delete '/shelters/:id', to: 'shelters#destroy'

  get '/pets', to: 'pets#index'
  get '/pets/:id', to: 'pets#show'
  get '/pets/:id/edit', to: 'pets#edit'
  patch '/pets/:id', to: 'pets#update'
  delete '/pets/:id', to: 'pets#destroy'

  get '/shelters/:shelter_id/pets', to: 'shelters#pets'
  get '/shelters/:shelter_id/pets/new', to: 'pets#new'
  post '/shelters/:shelter_id/pets', to: 'pets#create'
end
