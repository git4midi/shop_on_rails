module ItemsHelper
  
  def category_id_from_item
    return nil if @item.nil? || @item.item_template_id.nil?
    item_template_by_id(@item.item_template_id).category_id
  end
  
  def get_path_for_item(action)
    case action
    when :new
      return lambda{ new_items_management_category_item_path(@current_category_id) } unless @current_category_id.nil?
      return lambda{ new_items_management_item_path }
    when :create
      return lambda{ items_management_category_items_path(@current_category_id) } unless @current_category_id.nil?
      return lambda{ items_management_items_path }
    when :edit
      return lambda{|id| edit_items_management_category_item_path(@current_category_id, id) } unless @current_category_id.nil?
      return lambda{|id| edit_items_management_item_path(id) }
    when :patch, :update
      return lambda{|id| items_management_category_item_path(@current_category_id, id) } unless @current_category_id.nil?
      return lambda{|id| items_management_item_path(id) }
    when :delete, :destroy
      return lambda{|id| items_management_category_item_path(@current_category_id, id) } unless @current_category_id.nil?
      return lambda{|id| items_management_item_path(id) }
    else
      raise "Unrecognised action in get_path_for_item(action), action=#{action}"
    end
  end

  def pages_pagination_for_shop_items
    path = shop_items_path
    path = shop_category_items_path(@current_category_id) unless @current_category_id.nil?
    pages_pagination(path, @items_without_limits.length, @items_count_on_page, @items_start)
  end

  def items_count_pagination_for_shop_items
    path = shop_items_path
    path = shop_category_items_path(@current_category_id) unless @current_category_id.nil?
    items_count_pagination path
  end
  
  def print_item_comments(i, t)
    comments = ""
    comments += "<div class='comment'>#{h i.visible_comment}<div>" unless i.visible_comment.empty?
    comments += "<div class='comment'>#{h i.hidden_comment}<div>" if !i.hidden_comment.empty? && i.user_id == @current_user_id
    comments.html_safe
  end
  
  def print_item_caption(i, t)
    item_link = link_to( i.caption, "?#{url_replacer_encode_key(:item_id)}=#{i.id}", target: :_blank)
    item_caption = "<span class='caption'>#{item_link}</span>"
    unless t.requirements_align_type == ItemAlignTypes::ITEM_ALIGN_ANY then
      align_data = ItemAlignTypes.get_data_by_type_value(t.requirements_align_type)
      item_caption += " <img src='#{align_data[:image_link]}'>"
    end
    item_caption.html_safe
  end

  def print_item_caption_for_compact(i)
    path = shop_category_items_path(category_id: @current_category_id)
    item_link = link_to( i[:caption], path, method: :get, remote: @use_remote, format: @response_format, data: {scroll_top: true, items_caption: u(i[:caption])})
    item_caption = "<span class='caption'>#{item_link}</span>"
    unless i[:requirements_align_type] == ItemAlignTypes::ITEM_ALIGN_ANY then
     align_data = ItemAlignTypes.get_data_by_type_value(i[:requirements_align_type])
     item_caption += " <img src='#{align_data[:image_link]}'>"
    end
    item_caption.html_safe
  end
      
  
  def print_item_requirements(i, t)
    params = [
      { caption: "Уровень",                                   value: i.requirements_level },
        
      { caption: "Сила",                                      value: i.requirements_stats_strenght }, 
      { caption: "Ловкость",                                  value: i.requirements_stats_agility },
      { caption: "Интуиция",                                  value: i.requirements_stats_intuition },
      { caption: "Выносливость",                              value: i.requirements_stats_endurance },
      { caption: "Интеллект",                                 value: i.requirements_stats_intellect },

      { caption: "Мастерство владения ножами и кастетами",    value: i.requirements_masteries_knives },
      { caption: "Мастерство владения мечами",                value: i.requirements_masteries_swords },
      { caption: "Мастерство владения дубинами и булавами",   value: i.requirements_masteries_clubs },
      { caption: "Мастерство владения топорами и секирами",   value: i.requirements_masteries_axes },

      { caption: "Мастерство владения магией Света",          value: i.requirements_masteries_light_magic },
      { caption: "Мастерство владения серой магией",          value: i.requirements_masteries_gray_magic },
      { caption: "Мастерство владения магией Тьмы",           value: i.requirements_masteries_dark_magic }
    ]

    print_item_params(i, t, params, "Требуется минимальное").html_safe
  end
 
  def print_item_effects(i, t)
    params = [
      { caption: "Уровень жизни",                             value: i.effects_health },
        
      { caption: "Сила",                                      value: i.effects_stats_strenght }, 
      { caption: "Ловкость",                                  value: i.effects_stats_agility },
      { caption: "Интуиция",                                  value: i.effects_stats_intuition },
      { caption: "Выносливость",                              value: i.effects_stats_endurance },
      { caption: "Интеллект",                                 value: i.effects_stats_intellect },

      { caption: "Мф. критических ударов",                    value: i.effects_modifiers_crit },
      { caption: "Мф. против крит. ударов",                   value: i.effects_modifiers_anticrit },
      { caption: "Мф. увертливости",                          value: i.effects_modifiers_dodge },
      { caption: "Мф. против увертлив.",                      value: i.effects_modifiers_antidodge },

      { caption: "Мастерство владения ножами и кастетами",    value: i.effects_masteries_knives },
      { caption: "Мастерство владения мечами",                value: i.effects_masteries_swords },
      { caption: "Мастерство владения дубинами и булавами",   value: i.effects_masteries_clubs },
      { caption: "Мастерство владения топорами и секирами",   value: i.effects_masteries_axes },

      { caption: "Мастерство владения магией Света",          value: i.effects_masteries_light_magic },
      { caption: "Мастерство владения серой магией",          value: i.effects_masteries_gray_magic },
      { caption: "Мастерство владения магией Тьмы",           value: i.effects_masteries_dark_magic },

      { caption: "Броня головы",                              value: i.effects_armor_head },
      { caption: "Броня корпуса",                             value: i.effects_armor_torso },
      { caption: "Броня пояса",                               value: i.effects_armor_waist },
      { caption: "Броня ног",                                 value: i.effects_armor_legs },

      { caption: "Получаемый опыт",                           value: i.effects_experience_multiplier },
      { caption: "Рюкзак",                                    value: i.effects_backpack }
    ]
    
    print_item_params(i, t, params, "Действует на", show_plus = true).html_safe
  end

  def print_item_properties(i, t)
    params = [
      { caption: "Минимальный урон",                          value: i.effects_damage_minimum },
      { caption: "Максимальный урон",                         value: i.effects_damage_maximum },
      { caption: "Дополнительный урон",                       value: i.effects_damage_additional },
      { caption: "Свободные статы",                           value: i.effects_free_stats_count },
      { caption: "Двуручное оружие",                          value: t.is_two_handed,              class_style: "two_handed"}
    ]
    
    properties = print_item_params(i, t, params, "Свойства предмета")
    
    unless t.requirements_align_type == ItemAlignTypes::ITEM_ALIGN_ANY
      properties = "<div>Свойства предмета:</div>" if properties.empty?
      align_data = ItemAlignTypes.get_data_by_type_value(t.requirements_align_type)
      properties += "<div class='align'>• Требуется #{align_data[:caption]} склонность</div>"
    end
    
    properties.html_safe
  end  
  
  def print_item_embedded_magic(i, t)
    output_str = ""
    unless t.embedded_magic_magic_type == EmbeddedMagicTypes::MAGIC_WITHOUT_MAGIC
      data = EmbeddedMagicTypes.get_data_by_type_value(t.embedded_magic_magic_type)
      output_str = "<span class='embedded_magic_label'>Встроено заклятие:</span> " + 
        "<img src='#{data[:image_link]}'> #{data[:caption]}<small>[#{i.embedded_magic_recharges_count}/#{t.embedded_magic_recharges_count_max}]</small>"
    end
    output_str.html_safe
  end
  
  def print_item_enchants(i, t)
    output_str = ""
    row = ""
    count_in_row_max = 4
    count_in_row_current = 0
    enchants = {
      EMBEDDED_HP_IN_ARMOR_HP15:  i.embedded_hp_in_armor == EmbeddedHPInArmorTypes[:EMBEDDED_HP_IN_ARMOR_HP15],
      EMBEDDED_HP_IN_ARMOR_HP25:  i.embedded_hp_in_armor == EmbeddedHPInArmorTypes[:EMBEDDED_HP_IN_ARMOR_HP25],
          
      EMBEDDED_HP_IN_RING_HP5:    i.embedded_hp_in_ring_hp5,
      EMBEDDED_HP_IN_RING_HP10:   i.embedded_hp_in_ring_hp10,
      EMBEDDED_HP_IN_RING_HP15:   i.embedded_hp_in_ring_hp15,

      SHARPENING_PLUS5:           i.sharpening_plus5,
      SHARPENING_UNIVERSAL1:      i.sharpening_universal1,
      SHARPENING_UNIVERSAL2:      i.sharpening_universal2,
      SHARPENING_UNIVERSAL3:      i.sharpening_universal3,

      WEAPON_POSSESSION_PLUS1:    i.weapon_possession_plus1,
      WEAPON_POSSESSION_PLUS2:    i.weapon_possession_plus2,
      WEAPON_POSSESSION_PLUS3:    i.weapon_possession_plus3
    }
    
    enchants.each_key do |key|
      next if enchants[key] == false
      
      if count_in_row_current == count_in_row_max then
        output_str += "<div>#{row}</div>"
        row = ""
        count_in_row_current = 0
      end
      
      data = EnchantTypes.get_data_by_type_value( EnchantTypes.hash[key]  )
      row += "<img src='#{data[:image_link]}' title='#{data[:caption]}' alt='#{data[:caption]}'>"
      count_in_row_current += 1
    end

    output_str += "<div>#{row}</div>" unless row.empty?
    
    output_str.html_safe
  end
   
  def print_item_seller(i, t)
    "<div>продавец: <span class='seller'><a href='http://oldbk.ru/inf.php?#{i.user.user_name}' target='_blank'>#{i.user.user_name}</a></span><div>".html_safe
  end
  
  private
  
  def print_item_params(i, t, params, params_caption, show_plus = false)
    f = lambda do |caption, value, class_style, show_plus|
      class_str = class_style.nil? ? "" : " class='#{class_style}'"
      if !!value == value
        return "<div#{class_str}>• #{caption}</div>" if value == true
      else
        str_value = value.to_s
        str_value = (show_plus ? (value > 0 ? "+" : "") : "") + value.to_s
        return "<div#{class_str}>• #{caption}: #{str_value}</div>" if value > 0
      end
      ""
    end
    
    output_str = ""
    params.each {|p| output_str += f.call(p[:caption], p[:value], p[:class_style], show_plus) }    

    output_str = "<div>#{params_caption}:</div>" + output_str unless output_str.empty?
    output_str
  end
  
  def comtact_data_map(items)
    map = {}
    map = items.map do |row|
      { caption:                        row[:caption],
        image_link:                     row[:image_link],
        requirements_align_type:        row[:requirements_align_type],
        durability_maximum:             row[:durability_maximum],
        items_count:                    row[:items_count],
        price_cr_min:                   row[:price_cr_min],
        price_cr_max:                   row[:price_cr_max],
        durability_current_min:         row[:durability_current_min],
        durability_current_max:         row[:durability_current_max],
        durability_current_maximum_min: row[:durability_current_maximum_min],
        durability_current_maximum_max: row[:durability_current_maximum_max]
      }
    end 
    map
  end
  
end
