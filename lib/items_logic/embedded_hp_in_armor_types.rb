require_relative "enchant_types"

class EmbeddedHPInArmorTypes
  EMBEDDED_HP_IN_ARMOR_HP15  = 15; 
  EMBEDDED_HP_IN_ARMOR_HP25  = 25; 
  
  def self.[](key)
    self.const_get(key)
  end
  
  def self.map
    map = []
    map += self.constants.map {|key| [key, const_get(key)] }
  end
  
  def self.hash
    hash = {}
    self.constants.each {|key| hash[key] = const_get(key) }
    hash
  end

  def self.improvements_hp_hash
    hash = {}
    self.hash.each_pair {|key, value| hash[key] = {value: value, caption: EnchantTypes.enchants_types_data[key][:caption]} }
    hash
  end
  
end