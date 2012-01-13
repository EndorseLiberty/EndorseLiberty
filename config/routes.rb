RonPaul::Application.routes.draw do
  match '/watched', :to => 'welcome#watched', :as => :watched
  match '/done_sharing', :to => 'welcome#done_sharing', :as => :done_sharing
  #root :to => 'welcome#path'
end