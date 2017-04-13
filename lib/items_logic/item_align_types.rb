class ItemAlignTypes
  ITEM_ALIGN_ANY      = 21000  #любая
  ITEM_ALIGN_LIGHT    = 21001  #светлая
  ITEM_ALIGN_NEUTRAL  = 21002  #нейтральная
  ITEM_ALIGN_DARK     = 21003  #темная
  
  private
  
  def self.align_types_data
    dressrom_images = "/images/selfmodules/dressroom/"
    
    enchants_types_data = {
      ITEM_ALIGN_LIGHT:   { caption: "светлая",         image_link: dressrom_images + "align/align_1.gif" },
      ITEM_ALIGN_NEUTRAL: { caption: "нейтральная",     image_link: dressrom_images + "align/align_2.gif" },
      ITEM_ALIGN_DARK:    { caption: "тёмная",          image_link: dressrom_images + "align/align_3.gif" }
    }
  end

  public
    
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

def self.get_data_by_type_value(value)
  self.align_types_data[ self.hash.key(value) ]
end 
  
end