# Put your extension routes here.

# map.namespace :admin do |admin|
#   admin.resources :whatever
# end  

map.namespace :admin do |admin|
   admin.resources :products do |product|
     product.resources :accessories, :member => {:select => :post, :remove => :post}, :collection => {:available => :post, :selected => :get}
   end
end  
