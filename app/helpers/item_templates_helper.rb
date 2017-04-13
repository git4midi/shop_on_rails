module ItemTemplatesHelper
  
  def item_template_by_id(id)
    ItemTemplate.find_by_id(id)
  end
  
  def item_template_caption_by_id(id)
    item_template_by_id(id).caption
  end
  
  def item_templates_map_for_item_template_selection(item_template_id = nil)
    category_id = params[:category_id]
    category_id = ItemTemplate.find_by_id(item_template_id).category_id unless item_template_id.nil?
    map = []
    map += ItemTemplate.where(category_id: category_id).order(:caption).map {|i| [i.caption, i.id]}
    map
  end
  
  def items_types_map_for_item_template_selection
    map = []
    map += ItemsTypes.description_hash.values.map {|t| [ t[:caption], t[:value] ] }
    map
  end
  
  def categories_map_for_item_template_selection
    map = []
    Category.root_categories.map do |r|
      children_map = Category.select(:id, :caption).where(parent_id: r[:id]).map
      if children_map.size > 0 then
        children_map.each do |c|
          map << [ c[:caption], c[:id] ]
        end
      else
        map << [ r[:caption], r[:id] ]
      end
    end
    map
  end

  def get_path_for_item_template(action)
    case action
    when :new
      return lambda{ new_admin_category_item_template_path(@current_category_id) } unless @current_category_id.nil?
      return lambda{ new_admin_item_template_path }
    when :create
      return lambda{ admin_category_item_templates_path(@current_category_id) } unless @current_category_id.nil?
      return lambda{ admin_item_templates_path }
    when :edit
      return lambda{|id| edit_admin_category_item_template_path(@current_category_id, id) } unless @current_category_id.nil?
      return lambda{|id| edit_admin_item_template_path(id) }
    when :patch, :update
      return lambda{|id| admin_category_item_template_path(@current_category_id, id) } unless @current_category_id.nil?
      return lambda{|id| admin_item_template_path(id) }
    when :delete, :destroy
      return lambda{|id| admin_category_item_template_path(@current_category_id, id) } unless @current_category_id.nil?
      return lambda{|id| admin_item_template_path(id) }
    else
      raise "Unrecognised action in get_path_for_item_template(action), action=#{action}"
    end
  end
  
  def durability_maximum_from_item_template(item_template_id)
    check_item_template_id_on_nil item_template_id
    item_template_by_id(item_template_id).durability_maximum
  end

  private
  
  def check_item_template_id_on_nil(id)
    raise "item_template_id can't be nil!" if id.nil?
  end
  
end
