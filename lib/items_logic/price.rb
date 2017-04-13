require_relative "datahash"

class Price < DataHash
  
  def initialize(prefix = nil)
    prefix = prefix.nil? ? self.class.to_s : prefix.to_s + self.class.to_s
    
    price_hash = {
      default_cr: 0,
      cr: 0
    }
      
    super(price_hash, prefix)        
  end
  
end