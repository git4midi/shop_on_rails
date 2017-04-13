class AdminController < ApplicationController
  before_action :check_if_admin
  before_action :setup_common_variables
  
  layout :get_admin_html_or_json_layout
    
  def index
    respond_to do |format|
      format.html { render "index" }
      format.json do
        simple_json_response_with_replace(Shop_selectors::ADMIN_CONTENT_WRAPPER, (render_to_string "index.html.erb") )
      end
    end
  end
  
end
