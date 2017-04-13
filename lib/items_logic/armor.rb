require_relative "datahash"

class Armor < DataHash
  def initialize(prefix = nil)
    prefix = prefix.nil? ? self.class.to_s : prefix.to_s + self.class.to_s
    
    armor_hash = {
      head: 0,
      torso: 0,
      waist: 0,
      legs: 0 }
      
    super(armor_hash, prefix)        
  end
end