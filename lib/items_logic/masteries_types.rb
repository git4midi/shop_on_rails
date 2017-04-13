class MasteriesTypes
  KNIVES           = 1
  SWORDS           = 2
  CLUBS            = 3
  AXES             = 4
  LIGHT_MAGIC      = 5
  GRAY_MAGIC       = 6
  DARK_MAGIC       = 7
 
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
  
end