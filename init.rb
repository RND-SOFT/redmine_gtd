require 'redmine'
#require_dependency 'gtd'

class HooksGtd < Redmine::Hook::ViewListener
    def view_layouts_base_html_head(context)
      #ret = 
      return javascript_include_tag('jquery.sortable.js','jquery.fastLiveFilter.js', plugin: 'redmine_gtd')
    end
end

#Rails.configuration.to_prepare do
#   require 'queries_helper_patch'
#   QueriesHelper.send     :include, QueriesHelperPatch
  # require 'queries_helper'
  # QueriesHelper.send :include, QueriesHelper
#  QueriesHelper.send :include, QueriesHelperExt
  # IssuesController.send(:helper, :queries)
#end


Redmine::Plugin.register :redmine_gtd do
  name 'Взял и сделал'
  author 'Шлыков Олег'
  description 'Набрасывание плана задач на день из списка'
  version '0.3.0'
  menu :top_menu, :gtd,
                          {controller: 'gtd', action: 'index', project_id: nil},
                          caption: ' * Сегодня * '
	#                         if: Proc.new{ User.current.allowed_to?({:controller: 'contacts', action: 'index'},
  #                                        nil, {:global: true})  && ContactsSetting.contacts_show_in_top_menu? }

  settings default: {
    status_work_id: 3,
    status_standby_id: 4
    }, partial: 'settings/gtd'

end
