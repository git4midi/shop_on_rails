module ItemsManagementHelper
  
  def pages_pagination_for_items_management_items
    path = items_management_items_path
    path = items_management_category_items_path unless params[:category_id].nil?
    pages_pagination(path, @items_without_limits.count, @items_count_on_page, @items_start)
  end
  
  def items_count_pagination_for_items_managements_items
    path = items_management_items_path
    path = items_management_category_items_path unless params[:category_id].nil?
    items_count_pagination path
  end
  
  
  def stats_for_item_improvements
    hash = {}
    hash[:nil] = { value: 0, caption: "отсутствует" }
    hash.merge!( StatsTypes.improvements_stats_hash )
    hash
  end
  
  def embedded_hp_in_armor_for_item_improvements
    hash = {}
    hash[:nil] = { value: 0, caption: "отсутствует" }
    hash.merge!( EmbeddedHPInArmorTypes.improvements_hp_hash )
    hash
  end
  
end
