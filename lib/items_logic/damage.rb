require_relative "datahash"

class Damage < DataHash
  def initialize(prefix = nil)
    prefix = prefix.nil? ? self.class.to_s : prefix.to_s + self.class.to_s
    
    damage_hash = {
      minimum: 0,
      maximum: 0,
      additional: 0}
      
    super(damage_hash, prefix)        
  end
end