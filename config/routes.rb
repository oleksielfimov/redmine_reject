if Rails::VERSION::MAJOR >= 3
  RedmineApp::Application.routes.draw do
<<<<<<< HEAD
    match '/issues/:id/assign_reject', :controller => 'issues', :action => 'edit', :isRejected => true
  end
else
  ActionController::Routing::Routes.draw do |map|
    map.connect '/issues/:id/edit', :controller => 'issues', :action => 'edit', :isRejected => true
=======
    match '/issues/reject/:id', :controller => 'issues', :action => 'edit', :isRejected => true
  end
else
  ActionController::Routing::Routes.draw do |map|
    map.connect '/issues/reject/:id', :controller => 'issues', :action => 'edit', :isRejected => true
>>>>>>> de5fd339163bf011421274a495d087c55453d3aa
  end
end

