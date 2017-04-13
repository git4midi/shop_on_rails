class StatsTypes
  STRENGHT              = 1;
  AGILITY               = 2;
  INTUITION             = 3;
  ENDURANCE             = 4;
  INTELLECT             = 5;
  
  def self.[](key)
    self.const_get(key)
  end
  
  def self.map
    map = []
    map += self.constants.map {|key| [key, const_get(key)] }
  end
  
  def self.hash
    hash = {}
    self.constants.each {|key| hash[key] = const_get(key) }
    hash
  end
  
  def self.improvements_stats_hash
    hash = {}
    hash[:STRENGHT] =   {value: self[:STRENGHT],  caption: "на Силу" }
    hash[:AGILITY] =    {value: self[:AGILITY],   caption: "на Ловкость" }
    hash[:INTUITION] =  {value: self[:INTUITION], caption: "на Интуицию" }
    hash
  end
  
  def self.improvements_stats_values
    values = []
    self.improvements_stats_hash.map {|k,v| values.push( v[:value] ) }
    values
  end
  
end