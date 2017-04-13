require_relative "datahash"
require_relative "magic_types"

class EmbeddedMagic < DataHash
  def initialize(prefix = nil)
    prefix = prefix.nil? ? self.class.to_s : prefix.to_s + self.class.to_s
    
    embedded_magic_hash = {
      magic_type: MagicTypes::MAGIC_WITHOUT_MAGIC,
      magic_chance: 0,
      recharges_count: 0,
      recharges_count_max: 0 }
      
    super(embedded_magic_hash, prefix)        
  end
end