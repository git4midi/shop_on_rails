require_relative "datahash"

class Modifiers < DataHash
  
  def initialize(prefix = nil)
    prefix = prefix.nil? ? self.class.to_s : prefix.to_s + self.class.to_s
    
    modifiers_hash = {
      dodge: 0,
      antidodge: 0,
      crit: 0,
      anticrit: 0 }
      
    super(modifiers_hash, prefix)        
  end
  
end