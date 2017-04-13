class Admin::ItemTemplatesController < ApplicationController
  before_action :check_if_admin
  
  before_action :find_item_templates
  before_action :find_item_template, only: [:show, :edit, :update, :destroy]

  layout :get_admin_html_or_json_layout    
      
  def index
    respond_to do |format|
      format.html 
      format.json do
        simple_json_response_with_replace(Shop_selectors::ADMIN_CONTENT_WRAPPER, (render_to_string "index.html.erb") )
      end
    end
  end

  def show
    unless @item_template
      render text: "не найден шаблон с id=#{params[:id]}"
    end
  end
  
  def new
    @item_template = ItemTemplate.new
    respond_to do |format|
      format.html
      format.json do
        simple_json_response_with_replace(Shop_selectors::ADMIN_CONTENT_WRAPPER, (render_to_string "new.html.erb") )
      end
    end
  end
  
  def edit
    respond_to do |format|
      format.html 
      format.json do
        simple_json_response_with_replace(Shop_selectors::ADMIN_CONTENT_WRAPPER, (render_to_string "edit.html.erb") )
      end
    end
  end
  
  def create
    @item_template = ItemTemplate.new(item_template_params)
    if @item_template.save
      respond_to do |format|
        format.html { render 'index' }
        format.json do
          simple_json_response_with_replace(Shop_selectors::ADMIN_CONTENT_WRAPPER, (render_to_string "index.html.erb") )
        end
      end
    else
      error_message = @item_template.errors.full_messages.first
      respond_to do |format|
        format.html { render 'new' }
        format.json do
          set_error_notice_to_json_response error_message
          add_to_json_response_replace Shop_selectors::ADMIN_CONTENT_WRAPPER, (render_to_string "new.html.erb")
          render_json_response          
        end
      end
    end
  end
  
  def update
    if @item_template.update(item_template_params)
      
      @item_template.items.each do |item|
        item.processing_shop_item!
        item.save
      end
      
      respond_to do |format|
        format.html { render 'index' }
        format.json do
          set_success_notice_to_json_response "Изменения сохранены успешно"
          add_to_json_response_replace Shop_selectors::ADMIN_CONTENT_WRAPPER, (render_to_string "index.html.erb")
          render_json_response
        end
      end
    else
      error_message = @item_template.errors.full_messages.first
      respond_to do |format|
        format.html { render 'edit' } 
        format.json do
          set_error_notice_to_json_response error_message
          add_to_json_response_replace Shop_selectors::ADMIN_CONTENT_WRAPPER, (render_to_string "edit.html.erb")
          render_json_response
        end
      end
    end
  end
  
  def destroy
    @item_template = ItemTemplate.find(params[:id])
    @item_template.destroy
    self.index
  end

  private
  
  def item_template_params
    params.require(:item_template).permit(permitted_params)
  end
  
  def permitted_params
    model_params = [:category_id]
    shop_item_template_params = ShopItemTemplate.new.flatten(recursive = true, use_prefix = true)
    (model_params + shop_item_template_params).uniq 
  end
  
  def find_item_template
    @item_template = ItemTemplate.find_by_id(params[:id])
  end

  def find_item_templates
    templates = ItemTemplate.order(:category_id, :caption)
    templates = templates.where(category_id: params[:category_id]) unless params[:category_id].nil?
    @item_templates_without_limits = templates
    templates = templates.use_pages_limits(@items_count_on_page, @items_start)
    @item_templates = templates
  end
  
end
