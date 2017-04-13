require_relative "datahash"
require_relative "stats"
require_relative "modifiers"
require_relative "damage"
require_relative "armor"
require_relative "masteries"

class Effects < DataHash
  
  def initialize(prefix = nil)
    prefix = prefix.nil? ? self.class.to_s : prefix.to_s + self.class.to_s
    
    effects_hash = {
      health: 0,
      stats: Stats.new(prefix),
      modifiers: Modifiers.new(prefix),
      damage: Damage.new(prefix),
      armor: Armor.new(prefix),
      masteries: Masteries.new(prefix),
      experience_multiplier: 0,
      backpack: 0, 
      free_stats_count: 0}
      
    super(effects_hash, prefix)        
  end
  
end