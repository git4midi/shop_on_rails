class ItemsManagementController < ApplicationController
  before_action :setup_common_variables
  
  layout :get_items_management_html_or_json_layout
    
  def index
    respond_to do |format|
      format.html { render "index" }
      format.json do
        simple_json_response_with_replace(Shop_selectors::USER_WRAPPER, (render_to_string "index.html.erb") )
      end
    end
  end

  def joomla_index
    simple_json_response_with_replace(Shop_selectors::USER_WRAPPER, (render_to_string "index.html.erb") )
  end
end
