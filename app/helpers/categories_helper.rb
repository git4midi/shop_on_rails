module CategoriesHelper

  def category_caption_by_id(id)
    Category.find_by_id(id).caption
  end
  
  def parent_caption(category)
    return category.parent.caption unless category.parent.nil?
    "null"
  end

  def categories_root_map_for_selection
    map = [ ["нет родителя", nil] ] 
    map += Category.root_categories.map {|c| [c.caption, c.id]}
  end
  
  def get_current_category_chain(category_id = nil)
    category_id = params[:category_id] if category_id.nil?
    return "все" if category_id.nil?
  
    chain = ""
    c = Category.find_by_id(category_id)
    chain += c.caption
    chain = parent_caption(c) + " ► " + chain unless c.parent_id.nil?
    chain
  end
  
  def categories_get_count_for(category_id, count_this)
    case count_this
      when :item_templates
        Category.find_by_id(category_id).item_templates.count.to_s
      when :items
        Category.find_by_id(category_id).items.count.to_s
    else
      nil
    end
  end

          
end
