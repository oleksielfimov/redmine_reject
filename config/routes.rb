if Rails::VERSION::MAJOR >= 3
  RedmineApp::Application.routes.draw do
    match '/issues/reject/:id', :controller => 'issues', :action => 'edit', :isRejected => true
  end
else
  ActionController::Routing::Routes.draw do |map|
    map.connect '/issues/reject/:id', :controller => 'issues', :action => 'edit', :isRejected => true
  end
end

