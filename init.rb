require 'redmine'
<<<<<<< HEAD

=======
require 'dispatcher' unless Rails::VERSION::MAJOR >= 3
require 'issues_patch'
>>>>>>> de5fd339163bf011421274a495d087c55453d3aa

if Rails::VERSION::MAJOR >= 3
  Rails.configuration.to_prepare do
    Issue.send(:include, IssuesPatch)
<<<<<<< HEAD
    IssuesController.send(:include, IssuesControllerPatch)
=======
>>>>>>> de5fd339163bf011421274a495d087c55453d3aa
  end
else
  Dispatcher.to_prepare do
    Issue.send(:include, IssuesPatch)
  end
end

Redmine::Plugin.register :redmine_reject do
  name 'Redmine Reject tasks plugin'
  author 'Oleksii Ielfimov'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  project_module :redmine_reject do
    permission :redmine_reject, {:issues => [:reject, :edit, :show]}, :public => true
  end
end

