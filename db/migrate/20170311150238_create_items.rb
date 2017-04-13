class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.references :user,           index: true, null: false, foreign_key: {to_table: :users}
      t.references :item_template,  index: true, null: false, foreign_key: {to_table: :item_templates}
      
      t.timestamps
      
      t.string  :caption,                               null: false,        default: "default_item_caption"
      t.string  :visible_comment,                       null: false,        default: ""
      t.string  :hidden_comment,                        null: false,        default: ""
      
      t.integer :price_cr,                              null: false,        default: 0
      
      t.integer :durability_current,                    null: false,        default: 0
      t.integer :durability_current_maximum,            null: false,        default: 0

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
      
      t.integer :embedded_magic_recharges_count,        null: false,        default: 0
      
      t.integer :modification_by_stat,                  null: true,         default: nil
      t.integer :tempering_by_stat,                     null: true,         default: nil
      
      t.integer :embedded_hp_in_armor,                  null: false,        default: 0
      
      t.boolean :embedded_hp_in_ring_hp5,               null: false,        default: false
      t.boolean :embedded_hp_in_ring_hp10,              null: false,        default: false
      t.boolean :embedded_hp_in_ring_hp15,              null: false,        default: false
      
      t.boolean :sharpening_plus5,                      null: false,        default: false
      t.boolean :sharpening_universal1,                 null: false,        default: false
      t.boolean :sharpening_universal2,                 null: false,        default: false
      t.boolean :sharpening_universal3,                 null: false,        default: false
      
      t.boolean :weapon_possession_plus1,               null: false,        default: false
      t.boolean :weapon_possession_plus2,               null: false,        default: false
      t.boolean :weapon_possession_plus3,               null: false,        default: false
      
    end
  end
end
