require_relative "datahash"
require_relative "price"
require_relative "durability"
require_relative "requirements"
require_relative "effects"
require_relative "embedded_magic"

class ShopItem < DataHash
  
  def initialize(prefix = nil)

    shop_item_hash = {
      id: nil,
      caption: "default_item_caption",
      price: Price.new,
      durability: Durability.new,
      visible_comment: "",
      hidden_comment: "",
      requirements: Requirements.new,
      effects: Effects.new,
      
      embedded_magic_recharges_count: 0,
    
      modification_by_stat: nil,
      
      tempering_by_stat: nil,
      
      embedded_hp_in_armor: 0,
      
      embedded_hp_in_ring_hp5: false,
      embedded_hp_in_ring_hp10: false,
      embedded_hp_in_ring_hp15: false,
      
      sharpening_plus5: false,
      sharpening_universal1: false,
      sharpening_universal2: false,
      sharpening_universal3: false,
      
      weapon_possession_plus1: false,
      weapon_possession_plus2: false,
      weapon_possession_plus3: false
    }
      
    super(shop_item_hash, prefix)        
  end
  
end