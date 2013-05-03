ProcessSystem::Application.routes.draw do
  
  resources :applications do 
    get :start, :on => :member 
  end
end
