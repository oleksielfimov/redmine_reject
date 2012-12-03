require 'redmine'


if Rails::VERSION::MAJOR >= 3
  Rails.configuration.to_prepare do
    IssuesController.send(:include, IssuesControllerPatch)
  end
end


Redmine::Plugin.register :redmine_reject do
  name 'Redmine Reject tasks plugin'
  author 'Oleksii Ielfimov'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
  
end


