require_relative "datahash"

class Durability < DataHash
  
  def initialize(prefix = nil)
    prefix = prefix.nil? ? self.class.to_s : prefix.to_s + self.class.to_s
    
    durability_hash = {
      current: 0,
      current_maximum: 0,
      maximum: 0 }
      
    super(durability_hash, prefix)        
  end
  
end