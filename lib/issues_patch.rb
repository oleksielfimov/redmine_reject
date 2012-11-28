module IssuesPatch
  def self.included(base)
    base.send(:include, InstanceMethods)
  end
  
  module InstanceMethods
    # Returns previous assigned user
    def reject
<<<<<<< HEAD
      Journal.find(:all, :conditions => "journalized_id = #{@issue.id}").collect {|t| t.id}.each do |journal|
        return JournalDetail.find(:all, :conditions => (value = '#{User.current.id}' && id = journal), :order => "id DESC").collect {|u| u.old_value if u.prop_key == 'assigned_to_id' }.first 
=======
      Journal.find(:all, :conditions => "journalized_id = #{@issue.id}" ).collect {|t| t.id}.each do |journal|
        return JournalDetail.find(:all, :conditions => (value = '#{User.current.id}' && id = journal), :order => "id DESC" ).collect {|u| u.old_value if u.prop_key == 'assigned_to_id' }.first 
>>>>>>> de5fd339163bf011421274a495d087c55453d3aa
      end
    end
    def reject_assign
      User.find(:all, :conditions => "id = #{reject}").collect {|i| [i.name]}
    end
<<<<<<< HEAD
  end
=======
  end    
>>>>>>> de5fd339163bf011421274a495d087c55453d3aa
end




