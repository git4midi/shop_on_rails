require_relative "datahash"
require_relative "item_align_types"
require_relative "stats"
require_relative "masteries"

class Requirements < DataHash
  
  def initialize(prefix = nil)
    prefix = prefix.nil? ? self.class.to_s : prefix.to_s + self.class.to_s
    
    requirements_hash = {
      level: 0,
      align_type: ItemAlignTypes::ITEM_ALIGN_ANY,
      stats: Stats.new(prefix),
      masteries: Masteries.new(prefix) }
      
    super(requirements_hash, prefix)        
  end
  
end