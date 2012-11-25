 ActionController::Routing::Routes.draw do |map|
   map.connect '/issues/reject/:id', :controller => 'issues', :action => 'edit', :isRejected => true
 end

