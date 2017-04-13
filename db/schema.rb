# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170311150238) do

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "parent_id"
    t.string   "caption",    default: "default_category_caption", null: false
    t.integer  "order",      default: 0,                          null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.index ["parent_id"], name: "index_categories_on_parent_id", using: :btree
  end

  create_table "item_templates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "category_id",                                                                             null: false
    t.datetime "created_at",                                                                              null: false
    t.datetime "updated_at",                                                                              null: false
    t.integer  "item_type",                                     default: 0,                               null: false
    t.string   "caption",                                       default: "default_item_template_caption", null: false
    t.string   "image_link",                                    default: "/images/selfmodules/dressroom", null: false
    t.integer  "price_default_cr",                              default: 0,                               null: false
    t.integer  "durability_maximum",                            default: 0,                               null: false
    t.boolean  "is_two_handed",                                 default: false,                           null: false
    t.integer  "requirements_align_type",                       default: 21000,                           null: false
    t.integer  "requirements_level",                            default: 0,                               null: false
    t.integer  "requirements_stats_strenght",                   default: 0,                               null: false
    t.integer  "requirements_stats_agility",                    default: 0,                               null: false
    t.integer  "requirements_stats_intuition",                  default: 0,                               null: false
    t.integer  "requirements_stats_endurance",                  default: 0,                               null: false
    t.integer  "requirements_stats_intellect",                  default: 0,                               null: false
    t.integer  "requirements_masteries_knives",                 default: 0,                               null: false
    t.integer  "requirements_masteries_swords",                 default: 0,                               null: false
    t.integer  "requirements_masteries_clubs",                  default: 0,                               null: false
    t.integer  "requirements_masteries_axes",                   default: 0,                               null: false
    t.integer  "requirements_masteries_light_magic",            default: 0,                               null: false
    t.integer  "requirements_masteries_gray_magic",             default: 0,                               null: false
    t.integer  "requirements_masteries_dark_magic",             default: 0,                               null: false
    t.integer  "effects_health",                                default: 0,                               null: false
    t.integer  "effects_stats_strenght",                        default: 0,                               null: false
    t.integer  "effects_stats_agility",                         default: 0,                               null: false
    t.integer  "effects_stats_intuition",                       default: 0,                               null: false
    t.integer  "effects_stats_endurance",                       default: 0,                               null: false
    t.integer  "effects_stats_intellect",                       default: 0,                               null: false
    t.integer  "effects_modifiers_dodge",                       default: 0,                               null: false
    t.integer  "effects_modifiers_antidodge",                   default: 0,                               null: false
    t.integer  "effects_modifiers_crit",                        default: 0,                               null: false
    t.integer  "effects_modifiers_anticrit",                    default: 0,                               null: false
    t.integer  "effects_damage_minimum",                        default: 0,                               null: false
    t.integer  "effects_damage_maximum",                        default: 0,                               null: false
    t.integer  "effects_damage_additional",                     default: 0,                               null: false
    t.integer  "effects_armor_head",                            default: 0,                               null: false
    t.integer  "effects_armor_torso",                           default: 0,                               null: false
    t.integer  "effects_armor_waist",                           default: 0,                               null: false
    t.integer  "effects_armor_legs",                            default: 0,                               null: false
    t.integer  "effects_masteries_knives",                      default: 0,                               null: false
    t.integer  "effects_masteries_swords",                      default: 0,                               null: false
    t.integer  "effects_masteries_clubs",                       default: 0,                               null: false
    t.integer  "effects_masteries_axes",                        default: 0,                               null: false
    t.integer  "effects_masteries_light_magic",                 default: 0,                               null: false
    t.integer  "effects_masteries_gray_magic",                  default: 0,                               null: false
    t.integer  "effects_masteries_dark_magic",                  default: 0,                               null: false
    t.float    "effects_experience_multiplier",      limit: 24, default: 0.0,                             null: false
    t.integer  "effects_backpack",                              default: 0,                               null: false
    t.integer  "effects_free_stats_count",                      default: 0,                               null: false
    t.integer  "embedded_magic_magic_type",                     default: 21100,                           null: false
    t.integer  "embedded_magic_magic_chance",                   default: 0,                               null: false
    t.integer  "embedded_magic_recharges_count_max",            default: 0,                               null: false
    t.boolean  "can_be_modified",                               default: false,                           null: false
    t.boolean  "can_be_tempered",                               default: false,                           null: false
    t.boolean  "can_has_embedded_hp_in_armor",                  default: false,                           null: false
    t.boolean  "can_has_embedded_hp_in_ring",                   default: false,                           null: false
    t.boolean  "can_be_sharpened",                              default: false,                           null: false
    t.boolean  "can_has_weapons_possession",                    default: false,                           null: false
    t.index ["category_id"], name: "index_item_templates_on_category_id", using: :btree
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",                                                                        null: false
    t.integer  "item_template_id",                                                               null: false
    t.datetime "created_at",                                                                     null: false
    t.datetime "updated_at",                                                                     null: false
    t.string   "caption",                                       default: "default_item_caption", null: false
    t.string   "visible_comment",                               default: "",                     null: false
    t.string   "hidden_comment",                                default: "",                     null: false
    t.integer  "price_cr",                                      default: 0,                      null: false
    t.integer  "durability_current",                            default: 0,                      null: false
    t.integer  "durability_current_maximum",                    default: 0,                      null: false
    t.integer  "requirements_level",                            default: 0,                      null: false
    t.integer  "requirements_stats_strenght",                   default: 0,                      null: false
    t.integer  "requirements_stats_agility",                    default: 0,                      null: false
    t.integer  "requirements_stats_intuition",                  default: 0,                      null: false
    t.integer  "requirements_stats_endurance",                  default: 0,                      null: false
    t.integer  "requirements_stats_intellect",                  default: 0,                      null: false
    t.integer  "requirements_masteries_knives",                 default: 0,                      null: false
    t.integer  "requirements_masteries_swords",                 default: 0,                      null: false
    t.integer  "requirements_masteries_clubs",                  default: 0,                      null: false
    t.integer  "requirements_masteries_axes",                   default: 0,                      null: false
    t.integer  "requirements_masteries_light_magic",            default: 0,                      null: false
    t.integer  "requirements_masteries_gray_magic",             default: 0,                      null: false
    t.integer  "requirements_masteries_dark_magic",             default: 0,                      null: false
    t.integer  "effects_health",                                default: 0,                      null: false
    t.integer  "effects_stats_strenght",                        default: 0,                      null: false
    t.integer  "effects_stats_agility",                         default: 0,                      null: false
    t.integer  "effects_stats_intuition",                       default: 0,                      null: false
    t.integer  "effects_stats_endurance",                       default: 0,                      null: false
    t.integer  "effects_stats_intellect",                       default: 0,                      null: false
    t.integer  "effects_modifiers_dodge",                       default: 0,                      null: false
    t.integer  "effects_modifiers_antidodge",                   default: 0,                      null: false
    t.integer  "effects_modifiers_crit",                        default: 0,                      null: false
    t.integer  "effects_modifiers_anticrit",                    default: 0,                      null: false
    t.integer  "effects_damage_minimum",                        default: 0,                      null: false
    t.integer  "effects_damage_maximum",                        default: 0,                      null: false
    t.integer  "effects_damage_additional",                     default: 0,                      null: false
    t.integer  "effects_armor_head",                            default: 0,                      null: false
    t.integer  "effects_armor_torso",                           default: 0,                      null: false
    t.integer  "effects_armor_waist",                           default: 0,                      null: false
    t.integer  "effects_armor_legs",                            default: 0,                      null: false
    t.integer  "effects_masteries_knives",                      default: 0,                      null: false
    t.integer  "effects_masteries_swords",                      default: 0,                      null: false
    t.integer  "effects_masteries_clubs",                       default: 0,                      null: false
    t.integer  "effects_masteries_axes",                        default: 0,                      null: false
    t.integer  "effects_masteries_light_magic",                 default: 0,                      null: false
    t.integer  "effects_masteries_gray_magic",                  default: 0,                      null: false
    t.integer  "effects_masteries_dark_magic",                  default: 0,                      null: false
    t.float    "effects_experience_multiplier",      limit: 24, default: 0.0,                    null: false
    t.integer  "effects_backpack",                              default: 0,                      null: false
    t.integer  "effects_free_stats_count",                      default: 0,                      null: false
    t.integer  "embedded_magic_recharges_count",                default: 0,                      null: false
    t.integer  "modification_by_stat"
    t.integer  "tempering_by_stat"
    t.integer  "embedded_hp_in_armor",                          default: 0,                      null: false
    t.boolean  "embedded_hp_in_ring_hp5",                       default: false,                  null: false
    t.boolean  "embedded_hp_in_ring_hp10",                      default: false,                  null: false
    t.boolean  "embedded_hp_in_ring_hp15",                      default: false,                  null: false
    t.boolean  "sharpening_plus5",                              default: false,                  null: false
    t.boolean  "sharpening_universal1",                         default: false,                  null: false
    t.boolean  "sharpening_universal2",                         default: false,                  null: false
    t.boolean  "sharpening_universal3",                         default: false,                  null: false
    t.boolean  "weapon_possession_plus1",                       default: false,                  null: false
    t.boolean  "weapon_possession_plus2",                       default: false,                  null: false
    t.boolean  "weapon_possession_plus3",                       default: false,                  null: false
    t.index ["item_template_id"], name: "index_items_on_item_template_id", using: :btree
    t.index ["user_id"], name: "index_items_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "user_name",        default: "default_user_name",   null: false
    t.integer  "joomla_user_id",                                   null: false
    t.datetime "show_items_until", default: '2001-01-01 00:00:00', null: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_foreign_key "categories", "categories", column: "parent_id"
  add_foreign_key "item_templates", "categories"
  add_foreign_key "items", "item_templates"
  add_foreign_key "items", "users"
end
