class ItemsManagement::ItemsController < ApplicationController
  before_action :find_items
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  before_action :setup_item_default_variables_from_params, only: [:create, :update_new_form]

  before_action :check_category_presence, only: [:new]
    
  layout :get_items_management_html_or_json_layout
    
  def index
    respond_to do |format|
      format.html 
      format.json do
        simple_json_response_with_replace(Shop_selectors::USER_CONTENT_WRAPPER, (render_to_string "index.html.erb") )
      end
    end
  end

  def show
    unless @item
      render plain: "не найдена вещь с id=#{params[:id]}"
      return
    end
    self.edit
  end
  
  def new
    @item = Item.new
    @item.item_template_id = @item_template_id unless @item_template_id.nil?
    respond_to do |format|
      format.html
      format.json do
        simple_json_response_with_replace(Shop_selectors::USER_CONTENT_WRAPPER, (render_to_string "new.html.erb") )
      end
    end
  end
  
  def edit
    @item_template_id = @item.item_template_id
    respond_to do |format|
      format.html 
      format.json do
        simple_json_response_with_replace(Shop_selectors::USER_CONTENT_WRAPPER, (render_to_string "edit.html.erb") )
      end
    end
  end
  
  def create
    @item = Item.new(item_params)
    @item.user_id = @current_user_id
    
    @item.processing_shop_item!
    
    if @item.save
      respond_to do |format|
        format.html { render 'index' }
        format.json do
          simple_json_response_with_replace(Shop_selectors::USER_CONTENT_WRAPPER, (render_to_string "index.html.erb") )
        end
      end
    else
      error_message = @item.errors.full_messages.first
      respond_to do |format|
        format.html { render 'new' }
        format.json do
          set_error_notice_to_json_response error_message
          add_to_json_response_replace Shop_selectors::USER_CONTENT_WRAPPER, (render_to_string "new.html.erb")
          render_json_response 
        end
      end
    end
  end
  
  def update
    @item.processing_shop_item!(item_params)
    if @item.save
      respond_to do |format|
        format.html { render 'index' }
        format.json do
          set_success_notice_to_json_response "Изменения сохранены успешно"
          add_to_json_response_replace Shop_selectors::USER_CONTENT_WRAPPER, (render_to_string "index.html.erb")
          render_json_response
        end
      end
    else
      @item_template_id = @item.item_template_id
      error_message = @item.errors.full_messages.first
      respond_to do |format|
        format.html { render 'edit' } 
        format.json do
          set_error_notice_to_json_response error_message
          add_to_json_response_replace Shop_selectors::USER_CONTENT_WRAPPER, (render_to_string "edit.html.erb")
          render_json_response
        end
      end
    end
  end
  
  def destroy
    @item.destroy
    self.index
  end

  #-------------------
  
  def update_new_form
    self.new
  end
  
  private
  
  def item_params
    params.require(:item).permit(permitted_params)
  end
  
  def permitted_params
    model_params = [:item_template_id]
    shop_item_params = ShopItem.new.flatten(recursive = true, use_prefix = true)
    (model_params + shop_item_params).uniq 
  end
  
  def find_item
    @item = Item.find_by_id(params[:id])
  end
  
  def find_items
    item_templates = ItemTemplate.select(:id)
    item_templates = item_templates.where(category_id: @current_category_id) unless @current_category_id.nil?
    
    items = Item.where(user_id: @current_user_id).where(item_template_id: item_templates)
    items = items.order(:item_template_id, :caption)
    @items_without_limits = items
    items = items.use_pages_limits(@items_count_on_page, @items_start)
    @items = items
  end
  
  def setup_item_default_variables_from_params
    @item_template_id = params[:item].nil? ? nil : params[:item][:item_template_id]
  end
  
  def check_category_presence
    redirect_to items_management_path if @current_category_id.nil?
  end
  
end
