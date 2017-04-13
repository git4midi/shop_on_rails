require_relative "datahash"
require_relative "items_types"
require_relative "requirements"
require_relative "effects"
require_relative "magic_types"

class ShopItemTemplate < DataHash
  
  def initialize(prefix = nil)

    shop_item_template_hash = {
      id: nil,
      item_type: ItemsTypes::ITEM_TYPE_WITHOUT_TYPE,
      caption: "default_item_caption",
      image_link: "/images/dressroom",
      
      price_default_cr: 0,
      durability_maximum: 0,
      is_two_handed: false,
      requirements: Requirements.new,
      effects: Effects.new,
      
      embedded_magic_magic_type: MagicTypes::MAGIC_WITHOUT_MAGIC,
      embedded_magic_magic_chance: 0,
      embedded_magic_recharges_count_max: 0,
    
      can_be_modified: false,
      can_be_tempered: false,
      can_has_embedded_hp_in_armor: false,
      can_has_embedded_hp_in_ring: false,
      can_be_sharpened: false,
      can_has_weapons_possession: false  
    }

    super(shop_item_template_hash, prefix)        
  end
  
end