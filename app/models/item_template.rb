class ItemTemplate < ApplicationRecord
  belongs_to  :category
  has_many    :items,       dependent: :destroy

  validates :item_type,                             presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  
  validates :caption,                               presence: true, length: { maximum: 50 }
  validates :image_link,                            presence: true, length: { maximum: 1024 }

  validates :price_default_cr,                      presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  
  validates :durability_maximum,                    presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :is_two_handed,                                         inclusion:  { :in => [ true, false ] }

    
  validates :requirements_align_type,               presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
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

  validates :effects_health,                        presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :effects_stats_strenght,                presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :effects_stats_agility,                 presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :effects_stats_intuition,               presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :effects_stats_endurance,               presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :effects_stats_intellect,               presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    
  validates :effects_modifiers_dodge,               presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :effects_modifiers_antidodge,           presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :effects_modifiers_crit,                presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :effects_modifiers_anticrit,            presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :effects_damage_minimum,                presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :effects_damage_maximum,                presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :effects_damage_additional,             presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :effects_armor_head,                    presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :effects_armor_torso,                   presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :effects_armor_waist,                   presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :effects_armor_legs,                    presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :effects_masteries_knives,              presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :effects_masteries_swords,              presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :effects_masteries_clubs,               presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :effects_masteries_axes,                presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :effects_masteries_light_magic,         presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :effects_masteries_gray_magic,          presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :effects_masteries_dark_magic,          presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :effects_experience_multiplier,         presence: true, numericality: { only_float: true,   greater_than_or_equal_to: 0 }
    
  validates :effects_backpack,                      presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :effects_free_stats_count,              presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :embedded_magic_magic_type,             presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :embedded_magic_magic_chance,           presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :embedded_magic_recharges_count_max,    presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :can_be_modified,                                       inclusion:  { :in => [ true, false ] }
  validates :can_be_tempered,                                       inclusion:  { :in => [ true, false ] }
  validates :can_has_embedded_hp_in_armor,                          inclusion:  { :in => [ true, false ] }
  validates :can_has_embedded_hp_in_ring,                           inclusion:  { :in => [ true, false ] }
  validates :can_be_sharpened,                                      inclusion:  { :in => [ true, false ] }
  validates :can_has_weapons_possession,                            inclusion:  { :in => [ true, false ] }
    
end
