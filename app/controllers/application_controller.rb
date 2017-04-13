require 'response_to_joomla'
require 'shop_selectors'
require 'notice'

class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  before_action :dddd
  
  before_action :prepare_response_to_joomla
  before_action :debug_params
  before_action :check_and_update_user_data
  before_action :setup_common_variables

  def dddd
    puts "<><><><><><><>APP_CONTROLLER_DDDD<><><><><><><><><>"
    m = ShopItem.new
    #puts m.hash_flatten(recursive = true, use_prefix = true).inspect
    #puts m.flatten(recursive = true, use_prefix = true).inspect
    puts "<><><><><><><><><><><><><><><><><><><><><><><><><>"
  end

  def url_replacer_hash
    hash = {  item_id:              "i",
              category_id:          "cat",
              items_caption:        "ic",
              show_compact:         "sc",
              items_count_on_page:  "c",
              items_start:          "s" }
  end

  def url_replacer_encode_key(decoded_key)
    hash = url_replacer_hash
    raise "url_replacer_hash hasn't key=#{decoded_key}" unless hash.key?(decoded_key)
    hash[decoded_key]
  end
  helper_method :url_replacer_encode_key
  
  def url_replacer_decode_key(encoded_key)
    key = url_replacer_hash.key(encoded_key)
    raise "url_replacer_hash hasn't value=#{encoded_key}" if key.nil?
    key
  end
  helper_method :url_replacer_decode_key
  
  def get_admin_html_or_json_layout
    return "admin/for_html.html.erb" if requested_html_format?
    "admin/for_json.html.erb"
  end
  
  def get_items_management_html_or_json_layout
    return "items_management/for_html.html.erb" if requested_html_format?
    "items_management/for_json.html.erb"
  end
  
  def set_html_to_json_response( html)
    @response_to_joomla.html_content =  html
  end
  
  def set_notice_to_json_response( message, notice_level = Notice::SIMPLE )
    @response_to_joomla.set_notice message, notice_level
  end
  
  def set_success_notice_to_json_response( message )
    set_notice_to_json_response message, Notice::SUCCESS
  end

  def set_warning_notice_to_json_response( message )
    set_notice_to_json_response message, Notice::WARNING
  end
    
  def set_error_notice_to_json_response( message )
    set_notice_to_json_response message, Notice::ERROR
  end
    
  def render_json_response
    render json: @response_to_joomla.get_response_hash        
  end
  
  def add_to_json_response_replace( selector, data )
    @response_to_joomla.add_to_replace selector, data
  end
  
  def add_to_json_response_append( selector, data )
    @response_to_joomla.add_to_append selector, data
  end

  def add_to_json_response_remove( selector )
    @response_to_joomla.add_to_remove selector
  end
  
  def simple_json_response_with_replace( selector, data )
     prepare_response_to_joomla
     add_to_json_response_replace selector, data
     render_json_response     
   end
   
  private

  def prepare_response_to_joomla
    @response_to_joomla = ResponseToJoomla.new
  end

  def setup_common_variables
    @use_remote = requested_json_format?
    @response_format = requested_format
    
    @current_category_id = params[:category_id].nil? ? nil : params[:category_id].to_i
    @current_category_id = params[ url_replacer_encode_key(:category_id) ].to_i unless params[ url_replacer_encode_key(:category_id) ].nil?
    
    @show_compact = params[ url_replacer_encode_key(:show_compact) ].nil? ? false : params[ url_replacer_encode_key(:show_compact) ].to_bool

    @items_caption = params[ url_replacer_encode_key(:items_caption) ].nil? ? nil : URI.decode( params[ url_replacer_encode_key(:items_caption) ] )

    @items_count_on_page = params[ url_replacer_encode_key(:items_count_on_page) ].nil? ? nil : params[ url_replacer_encode_key(:items_count_on_page) ].to_i 
    @items_start = params[ url_replacer_encode_key(:items_start) ].nil? ? nil : params[ url_replacer_encode_key(:items_start) ].to_i
      
  end

  def debug_params
    puts "-----------APP_CONTROLLER_DEBUG_PARAMS--------------------"
    puts params.inspect
    puts "requested format = #{requested_format}"
    puts "----------------------------------------------------------"
  end 
  
  def requested_format
    if( params[:format].nil? ) then format = :html
    else
      format = params[:format].to_sym
    end
    format
  end

  def requested_html_format?
    return true if requested_format == :html
    false
  end

  def requested_json_format?
    return true if requested_format == :json
    false
  end
  
  def check_and_update_user_data
    if params[:isJoomlaAdmin].nil? || params[:joomlaUserId].nil? || params[:joomlaUserName].nil? || params[:isJoomlaGuest].nil? then
      respond_to do |format|
        format.html do
          render plain: "Error 417", status: :expectation_failed, layout: false 
        end
        format.json do
          set_html_to_json_response "Error 417"
          render_json_response
        end
      end
      return
    end
    
    @current_user_id = nil
    
    if is_user_registered? then 
      user_record = User.find_or_create_by!(joomla_user_id: params[:joomlaUserId])
      user_name = params[:joomlaUserName]
      time_to_show = 7.days
      time_to_show = 1.years if is_user_admin?
      show_items_until = Time.now + time_to_show
      current_user = User.update(user_record.id, {user_name: user_name, show_items_until: show_items_until} )
      @current_user_id = current_user.id
    end
    
  end
  
  def is_user_registered?
    return true unless params[:isJoomlaGuest].nil? || params[:isJoomlaGuest].to_bool == true
    false
  end
  
  def is_user_admin?
    return true unless params[:isJoomlaAdmin].nil? || params[:isJoomlaAdmin].to_bool == false
    false
  end
  
  def check_if_admin
    unless is_user_admin?
      respond_to do |format|
        format.html do
          render plain: "Error 403", status: :forbidden, layout: false 
        end
        format.json do
          set_html_to_json_response "Error 403"
          render_json_response
        end
      end
      return
    end
    puts "---JOOMLA ADMIN---"
  end
  
end
