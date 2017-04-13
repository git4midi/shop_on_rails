class CreateItemTemplates < ActiveRecord::Migration[5.0]
  def change
    create_table :item_templates do |t|
      t.references :category,                           null: false, index: true, foreign_key: {to_table: :categories}
    
      t.timestamps
    
      t.integer :item_type,                             null: false,        default: 0 #ItemsTypes::ITEM_TYPE_WITHOUT_TYPE = 0
    
      t.string  :caption,                               null: false,        default: "default_item_template_caption"
      t.string  :image_link,                            null: false,        default: "/images/selfmodules/dressroom" 
      t.integer :price_default_cr,                      null: false,        default: 0

      t.integer :durability_maximum,                    null: false,        default: 0
    
      t.boolean :is_two_handed,                         null: false,        default: false

      t.integer :requirements_align_type,               null: false,        default: 21000 #ItemAlignTypes::ITEM_ALIGN_ANY
      t.integer :requirements_level,                    null: false,        default: 0
    
      t.integer :requirements_stats_strenght,           null: false,        default: 0
      t.integer :requirements_stats_agility,            null: false,        default: 0
      t.integer :requirements_stats_intuition,          null: false,        default: 0
      t.integer :requirements_stats_endurance,          null: false,        default: 0
      t.integer :requirements_stats_intellect,          null: false,        default: 0
    
      t.integer :requirements_masteries_knives,         null: false,        default: 0
      t.integer :requirements_masteries_swords,         null: false,        default: 0
      t.integer :requirements_masteries_clubs,          null: false,        default: 0
      t.integer :requirements_masteries_axes,           null: false,        default: 0
    
      t.integer :requirements_masteries_light_magic,    null: false,        default: 0
      t.integer :requirements_masteries_gray_magic,     null: false,        default: 0
      t.integer :requirements_masteries_dark_magic,     null: false,        default: 0
    
      t.integer :effects_health,                        null: false,        default: 0
    
      t.integer :effects_stats_strenght,                null: false,        default: 0
      t.integer :effects_stats_agility,                 null: false,        default: 0
      t.integer :effects_stats_intuition,               null: false,        default: 0
      t.integer :effects_stats_endurance,               null: false,        default: 0
      t.integer :effects_stats_intellect,               null: false,        default: 0
    
      t.integer :effects_modifiers_dodge,               null: false,        default: 0
      t.integer :effects_modifiers_antidodge,           null: false,        default: 0
      t.integer :effects_modifiers_crit,                null: false,        default: 0
      t.integer :effects_modifiers_anticrit,            null: false,        default: 0
    
      t.integer :effects_damage_minimum,                null: false,        default: 0
      t.integer :effects_damage_maximum,                null: false,        default: 0
      t.integer :effects_damage_additional,             null: false,        default: 0
    
      t.integer :effects_armor_head,                    null: false,        default: 0
      t.integer :effects_armor_torso,                   null: false,        default: 0
      t.integer :effects_armor_waist,                   null: false,        default: 0
      t.integer :effects_armor_legs,                    null: false,        default: 0
    
      t.integer :effects_masteries_knives,              null: false,        default: 0
      t.integer :effects_masteries_swords,              null: false,        default: 0
      t.integer :effects_masteries_clubs,               null: false,        default: 0
      t.integer :effects_masteries_axes,                null: false,        default: 0
    
      t.integer :effects_masteries_light_magic,         null: false,        default: 0
      t.integer :effects_masteries_gray_magic,          null: false,        default: 0
      t.integer :effects_masteries_dark_magic,          null: false,        default: 0
    
      t.float   :effects_experience_multiplier,         null: false,        default: 0.0
      t.integer :effects_backpack,                      null: false,        default: 0
      t.integer :effects_free_stats_count,              null: false,        default: 0

      t.integer :embedded_magic_magic_type,             null: false,        default: 21100 #MagicTypes::MAGIC_WITHOUT_MAGIC
      t.integer :embedded_magic_magic_chance,           null: false,        default: 0
      t.integer :embedded_magic_recharges_count_max,    null: false,        default: 0

      t.boolean :can_be_modified,                       null: false,        default: false
      t.boolean :can_be_tempered,                       null: false,        default: false
      t.boolean :can_has_embedded_hp_in_armor,          null: false,        default: false
      t.boolean :can_has_embedded_hp_in_ring,           null: false,        default: false
      t.boolean :can_be_sharpened,                      null: false,        default: false
      t.boolean :can_has_weapons_possession,            null: false,        default: false
    end
  end
end
