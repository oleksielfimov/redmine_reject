if Rails::VERSION::MAJOR >= 3
  RedmineApp::Application.routes.draw do
    match '/issues/:id/assign_reject', :controller => 'issues', :action => 'edit', :isRejected => true
  end
else
  ActionController::Routing::Routes.draw do |map|
    map.connect '/issues/:id/edit', :controller => 'issues', :action => 'edit', :isRejected => true
  end
end

