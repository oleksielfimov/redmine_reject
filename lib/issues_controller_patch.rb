module IssuesControllerPatch
  unloadable
  
  def self.included(base)
    base.send(:include, InstanceMethods)
    base.class_eval do
      before_filter :if_reject, :only => [:edit]
      before_filter :reject, :only => [:edit]
      before_filter :reject_assign, :only => [:edit]
      
    end
  end
  
  module InstanceMethods
    def if_reject
      if params[:reject]
        @reject_id = true
        @issue_for_reject = Issue.find(params[:id])
      end
    end
    def reject
      Journal.find(:all, :conditions => "journalized_id = #{@issue_for_reject.id}").collect {|t| t.id}.each do |journal|
        @reject_user_id = JournalDetail.find(:all, :conditions => ("value = #{User.current.id}" && id = journal), :order => "id DESC").collect {|u| u.old_value if u.prop_key == 'assigned_to_id' }.first 
        if @reject_user_id.nil?
           @user_reject_id = @issue_for_reject.author_id
        else
          @user_reject_id = @reject_user_id 
        end
      end
    end
    def reject_assign
      @user_reject = User.find(:all, :conditions => "id = #{@user_reject_id}").collect {|i| [i.name]}
    end
  end
end

