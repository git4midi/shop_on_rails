class Shop::ItemsController < ApplicationController
  before_action :setup_item_default_variables_from_params
  before_action :find_items

  layout :get_items_management_html_or_json_layout

  def index
    respond_to do |format|
      format.html 
      format.json do
        simple_json_response_with_replace(Shop_selectors::SHOP_CONTENT_WRAPPER, (render_to_string "index.html.erb") )
      end
    end
  end


  #-------------------
  private
  
  def permitted_params
    model_params = [:item_template_id]
    shop_item_params = ShopItem.new.flatten(recursive = true, use_prefix = true)
    (model_params + shop_item_params).uniq 
  end
  
  def find_items
    item_templates = ItemTemplate.all
    item_templates = item_templates.where(category_id: @current_category_id) unless @current_category_id.nil?
    
    if @show_compact
      fields = [
        :caption,
        :image_link,
        :requirements_align_type,
        :durability_maximum,
        "count(1)                           as `items_count`",
        "min(`price_cr`)                    as `price_cr_min`",
        "max(`price_cr`)                    as `price_cr_max`",
        "min(`durability_current`)          as `durability_current_min`",
        "max(`durability_current`)          as `durability_current_max`",
        "min(`durability_current_maximum`)  as `durability_current_maximum_min`",
        "max(`durability_current_maximum`)  as `durability_current_maximum_max`"
        ]
      items = Item.select(fields).where(item_template_id: item_templates).joins(:item_template).group(:caption).order(:caption)
    else
      items = Item.where(item_template_id: item_templates)
      items = items.where(id: @item_id) unless @item_id.nil?
      items = items.where(caption: @items_caption) unless @items_caption.nil?
      items = items.includes(:item_template, :user)
      items = items.order(:caption, :price_cr, :item_template_id)
      
    end
    @items_without_limits = items
    items = items.use_pages_limits(@items_count_on_page, @items_start)
    @items = items
  end
  
  def setup_item_default_variables_from_params
    @item_id = params[:id].nil? ? nil : params[:id]
  end
  
end
