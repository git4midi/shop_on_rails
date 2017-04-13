require_relative "datahash"

class Stats < DataHash

  def initialize(prefix = nil)
    prefix = prefix.nil? ? self.class.to_s : prefix.to_s + self.class.to_s
    
    stats_hash = {
      strenght: 0,
      agility: 0,
      intuition: 0,
      endurance: 0,
      intellect: 0 }
    
    super(stats_hash, prefix)
  end
  
end