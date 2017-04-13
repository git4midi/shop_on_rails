module AdminHelper
 
  def items_count_pagination_for_admin_items_templates
    path = admin_item_templates_path
    path = admin_category_item_templates_path unless params[:category_id].nil?
    items_count_pagination path
  end
   
  def pages_pagination_for_admin_item_templates
    path = admin_item_templates_path
    path = admin_category_item_templates_path unless params[:category_id].nil?
    pages_pagination(path, @item_templates_without_limits.count, @items_count_on_page, @items_start)
  end
  
end
