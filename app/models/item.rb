class Item < ApplicationRecord
  belongs_to :item_template
  belongs_to :user

  validates :caption,                               presence: true, length: { maximum: 250 }
  validates :visible_comment,                       presence: true, allow_blank: true, length: { maximum: 250 }
  validates :hidden_comment,                        presence: true, allow_blank: true, length: { maximum: 250 }
  
  validates :price_cr,                              presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :durability_current,                    presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :durability_current_maximum,            presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    
  validates :requirements_level,                    presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    
  validates :requirements_stats_strenght,           presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :requirements_stats_agility,            presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :requirements_stats_intuition,          presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :requirements_stats_endurance,          presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :requirements_stats_intellect,          presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    
  validates :requirements_masteries_knives,         presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :requirements_masteries_swords,         presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :requirements_masteries_clubs,          presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :requirements_masteries_axes,           presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :requirements_masteries_light_magic,    presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :requirements_masteries_gray_magic,     presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :requirements_masteries_dark_magic,     presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :effects_health,                        presence: true, numericality: { only_integer: true }
    
  validates :effects_stats_strenght,                presence: true, numericality: { only_integer: true }
  validates :effects_stats_agility,                 presence: true, numericality: { only_integer: true }
  validates :effects_stats_intuition,               presence: true, numericality: { only_integer: true }
  validates :effects_stats_endurance,               presence: true, numericality: { only_integer: true }
  validates :effects_stats_intellect,               presence: true, numericality: { only_integer: true }

  validates :effects_modifiers_dodge,               presence: true, numericality: { only_integer: true }
  validates :effects_modifiers_antidodge,           presence: true, numericality: { only_integer: true }
  validates :effects_modifiers_crit,                presence: true, numericality: { only_integer: true }
  validates :effects_modifiers_anticrit,            presence: true, numericality: { only_integer: true }

  validates :effects_damage_minimum,                presence: true, numericality: { only_integer: true }
  validates :effects_damage_maximum,                presence: true, numericality: { only_integer: true }
  validates :effects_damage_additional,             presence: true, numericality: { only_integer: true }

  validates :effects_armor_head,                    presence: true, numericality: { only_integer: true }
  validates :effects_armor_torso,                   presence: true, numericality: { only_integer: true }
  validates :effects_armor_waist,                   presence: true, numericality: { only_integer: true }
  validates :effects_armor_legs,                    presence: true, numericality: { only_integer: true }

  validates :effects_masteries_knives,              presence: true, numericality: { only_integer: true }
  validates :effects_masteries_swords,              presence: true, numericality: { only_integer: true }
  validates :effects_masteries_clubs,               presence: true, numericality: { only_integer: true }
  validates :effects_masteries_axes,                presence: true, numericality: { only_integer: true }

  validates :effects_masteries_light_magic,         presence: true, numericality: { only_integer: true }
  validates :effects_masteries_gray_magic,          presence: true, numericality: { only_integer: true }
  validates :effects_masteries_dark_magic,          presence: true, numericality: { only_integer: true }

  validates :effects_experience_multiplier,         presence: true, numericality: { only_float: true }
    
  validates :effects_backpack,                      presence: true, numericality: { only_integer: true }
  validates :effects_free_stats_count,              presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :embedded_magic_recharges_count,        presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :modification_by_stat,                                  numericality: { allow_nil: true }
  validates :tempering_by_stat,                                     numericality: { allow_nil: true }
  
  validates :embedded_hp_in_armor,                  presence: true, numericality:  { only_integer: true, greater_than_or_equal_to: 0 }
  
  validates :embedded_hp_in_ring_hp5,                               inclusion:  { :in => [ true, false ] }
  validates :embedded_hp_in_ring_hp10,                              inclusion:  { :in => [ true, false ] }
  validates :embedded_hp_in_ring_hp15,                              inclusion:  { :in => [ true, false ] }

  validates :sharpening_plus5,                                      inclusion:  { :in => [ true, false ] }
  validates :sharpening_universal1,                                 inclusion:  { :in => [ true, false ] }
  validates :sharpening_universal2,                                 inclusion:  { :in => [ true, false ] }
  validates :sharpening_universal3,                                 inclusion:  { :in => [ true, false ] }
      
  validates :weapon_possession_plus1,                               inclusion:  { :in => [ true, false ] }
  validates :weapon_possession_plus2,                               inclusion:  { :in => [ true, false ] }
  validates :weapon_possession_plus3,                               inclusion:  { :in => [ true, false ] }
  
  def can_be_modified?
    item_template_data[:can_be_modified]
  end
  
  def has_modification?
    can_be_modified? && StatsTypes.improvements_stats_values.include?(self.modification_by_stat)
  end

  def can_be_tempered?
    item_template_data[:can_be_tempered]
  end
          
  def has_tempering?
    can_be_tempered? && StatsTypes.improvements_stats_values.include?(self.tempering_by_stat)
  end

  def can_has_embedded_hp_in_armor?
    item_template_data[:can_has_embedded_hp_in_armor]
  end
    
  def can_has_embedded_hp_in_ring?
    item_template_data[:can_has_embedded_hp_in_ring]
  end

  def can_be_sharpened?
    item_template_data[:can_be_sharpened] && ItemsTypes.can_be_sharpened?(item_type)
  end

  def has_sharpening?
    can_be_sharpened? && (self.sharpening_plus5 || self.sharpening_universal1 || self.sharpening_universal2 || self.sharpening_universal3)
  end

  def can_has_weapons_possession?
    item_template_data[:can_has_weapons_possession]
  end
  
  def has_weapons_possession?
    can_has_weapons_possession? && (self.weapon_possession_plus1 || self.weapon_possession_plus2 || self.weapon_possession_plus3 )
  end
 
  def has_embedded_magic?
    item_template_data[:embedded_magic_magic_type] != MagicTypes::MAGIC_WITHOUT_MAGIC
  end
     
  def processing_shop_item!(item_params = nil)
    puts "----PROCESSING-BEGIN--------"
     
    setup_defaults_from_template
    add_params_to_item(item_params)
    calculate_modification
    calculate_tempering
    calculate_embedded_hp_in_armor
    calculate_embedded_hp_in_ring
    calculate_sharpening
    calculate_weapons_possession
    puts "----PROCESSING-END--------"
  end
  
  private
  
  def item_type
    item_template_data[:item_type]
  end
  
  def setup_defaults_from_template
    @item_template_data = item_template_data
    
    shop_item = ShopItem.new
    
    self.caption = @item_template_data[:caption]
    self.requirements_level = @item_template_data[:requirements_level]
   
    shop_item.requirements.stats.hash_flatten(recursive = false, use_prefix = true).each_key { |key| self[key] = @item_template_data[key] }
    shop_item.requirements.masteries.hash_flatten(recursive = false, use_prefix = true).each_key { |key| self[key] = @item_template_data[key] }

    shop_item.effects.hash_flatten(recursive = true, use_prefix = true).each_key { |key| self[key] = @item_template_data[key] }
      
    self.embedded_hp_in_armor = 0 unless can_has_embedded_hp_in_armor?
    
    unless can_has_embedded_hp_in_ring? then
      self.embedded_hp_in_ring_hp5 = false
      self.embedded_hp_in_ring_hp10 = false
      self.embedded_hp_in_ring_hp15 = false
    end

    unless can_be_sharpened? then
      self.sharpening_plus5 = false
      self.sharpening_universal1 = false
      self.sharpening_universal2 = false
      self.sharpening_universal3 = false
    end
          
  end
  
  def add_params_to_item(item_params)
    item_params.each_pair { |key, value| self[key] = value } unless item_params.nil?
  end
  
  def item_template_data
    template_data = ItemTemplate.find_by_id(self.item_template_id)
    #.select(shop_item_template.flatten(recursive = true, use_prefix = true))
  end
  
  def calculate_modification
    if has_modification?
      self.caption += " (мф)"
      
      case self.modification_by_stat.to_i
      when StatsTypes::STRENGHT
        self.effects_health += 20
        self.effects_stats_strenght += 2
        self.effects_modifiers_anticrit += 10
        self.effects_modifiers_antidodge += 10
      when StatsTypes::AGILITY
        self.effects_health += 15
        self.effects_stats_agility += 2
        self.effects_modifiers_dodge += 10
        self.effects_modifiers_anticrit += 10
      when StatsTypes::INTUITION
        self.effects_health += 15
        self.effects_stats_intuition += 2
        self.effects_modifiers_antidodge += 10
        self.effects_modifiers_crit += 10
      else
        raise "Unknown item modification_by_stat value! modification_by_stat=#{self.modification_by_stat.to_i}"
      end
      
    end
  end
  
  def price_after_modification
    (item_template_data[:price_default_cr]*1.5).ceil + 30
  end
  
  def calculate_tempering
    if has_tempering?
      price = price_after_modification
      self.caption += " [8]"
      
      self.requirements_level = 8 if self.requirements_level < 8
      
      case self.tempering_by_stat.to_i
      when StatsTypes::STRENGHT
        self.effects_health +=              (price * 0.08).ceil
        self.effects_modifiers_anticrit +=  (price * 0.04).ceil
        self.effects_modifiers_antidodge += (price * 0.04).ceil
      when StatsTypes::AGILITY
        self.effects_health +=              (price * 0.08).ceil
        self.effects_modifiers_dodge +=     (price * 0.04).ceil
        self.effects_modifiers_anticrit +=  (price * 0.04).ceil
      when StatsTypes::INTUITION
        self.effects_health +=              (price * 0.08).ceil
        self.effects_modifiers_antidodge += (price * 0.04).ceil
        self.effects_modifiers_crit +=      (price * 0.04).ceil
      else
        raise "Unknown item tempering_by_stat value! tempering_by_stat=#{self.tempering_by_stat.to_i}"
      end
      
    end
  end
  
  def price_after_tempering
    (price_after_modification * 1.25).ceil
  end

  def calculate_embedded_hp_in_armor
    self.effects_health += self.embedded_hp_in_armor
  end

  def calculate_embedded_hp_in_ring
    self.effects_health += 5 if self.embedded_hp_in_ring_hp5
    self.effects_health += 10 if self.embedded_hp_in_ring_hp10
    self.effects_health += 15 if self.embedded_hp_in_ring_hp15
  end
  
  def calculate_sharpening
    if has_sharpening?
      sharpening_value = 0
      requirements_value = 0
      if self.sharpening_plus5 then
        sharpening_value += 5 
        requirements_value +=5
      end
      if self.sharpening_universal1 then
        sharpening_value += 1 
        requirements_value +=1
      end
      if self.sharpening_universal2 then
        sharpening_value += 2 
        requirements_value +=1
      end
      if self.sharpening_universal3 then
        sharpening_value += 3 
        requirements_value +=1
      end
      
      self.caption += " +#{sharpening_value}" if sharpening_value > 0
      puts sharpening_value.inspect
      puts self.caption
      puts self.caption
      
      case item_type
      when ItemsTypes::ITEM_TYPE_WEAPON_KNIFE
        self.requirements_stats_intuition   += requirements_value
        self.requirements_masteries_knives  += requirements_value
      when ItemsTypes::ITEM_TYPE_WEAPON_SWORD
        self.requirements_stats_endurance   += requirements_value
        self.requirements_masteries_swords  += requirements_value
      when ItemsTypes::ITEM_TYPE_WEAPON_CLUB
        self.requirements_stats_agility     += requirements_value
        self.requirements_masteries_clubs   += requirements_value
      when ItemsTypes::ITEM_TYPE_WEAPON_AXE
        self.requirements_stats_strenght    += requirements_value
        self.requirements_masteries_axes    += requirements_value
      else
        raise "Invalid item_type! value=#{item_type}"
      end
      
      self.effects_damage_minimum += sharpening_value
      self.effects_damage_maximum += sharpening_value
      
    end
  end

  def calculate_weapons_possession
    if has_weapons_possession?
      possession_value = 0
      possession_value += 1 if self.weapon_possession_plus1
      possession_value += 2 if self.weapon_possession_plus2
      possession_value += 3 if self.weapon_possession_plus3
      
      case item_type
      when ItemsTypes::ITEM_TYPE_WEAPON_KNIFE
        self.effects_masteries_knives   += possession_value
      when ItemsTypes::ITEM_TYPE_WEAPON_SWORD
        self.effects_masteries_swords   += possession_value
      when ItemsTypes::ITEM_TYPE_WEAPON_CLUB
        self.effects_masteries_clubs     += possession_value
      when ItemsTypes::ITEM_TYPE_WEAPON_AXE
        self.effects_masteries_axes      += possession_value
      else
        raise "Invalid item_type! value=#{item_type}"
      end

    end
  end 
                  
end
