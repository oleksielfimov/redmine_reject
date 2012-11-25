module IssuesPatch
def self.included(base)
  base.send(:include, InstanceMethods)
end

module InstanceMethods
# Returns previous assigned user
  def reject
    Journal.find(:all, :conditions => "journalized_id = #{@issue.id}" ).collect {|t| t.id}.each do |journal|
      z = JournalDetail.find(:all, :conditions => (value = '#{User.current.id}' && id = journal), :order => "id DESC" ).collect {|u| u.old_value if u.prop_key == 'assigned_to_id' }.first 
      return z
    end
  end
  def reject_assigne
    User.find(:all, :conditions => "id = #{reject}").collect {|i| [i.name]}
  end
end    
end

