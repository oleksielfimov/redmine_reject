module IssuesControllerPatch
  unloadable
  
  def self.included(base)
    base.send(:include, InstanceMethods)
    base.class_eval do
      before_filter :if_reject, :only => [:edit]
    end
  end
  
  module InstanceMethods
    def if_reject
      if params[:reject]
        @reject_id = @issue.id
      end
    end
  end
end

