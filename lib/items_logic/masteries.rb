require_relative "datahash"

class Masteries < DataHash

  def initialize(prefix = nil)
    prefix = prefix.nil? ? self.class.to_s : prefix.to_s + self.class.to_s
    
    masteries_hash = {
      knives: 0,
      swords: 0,
      clubs: 0,
      axes: 0,
      light_magic: 0,
      gray_magic: 0,
      dark_magic: 0 }
      
    super(masteries_hash, prefix)        
  end
  
end