class EnchantTypes
  EMBEDDED_HP_IN_ARMOR_HP15             = 23001
  EMBEDDED_HP_IN_ARMOR_HP25             = 23002

  EMBEDDED_HP_IN_RING_HP5               = 23010
  EMBEDDED_HP_IN_RING_HP10              = 23011
  EMBEDDED_HP_IN_RING_HP15              = 23012

  SHARPENING_PLUS5                      = 23020
  SHARPENING_UNIVERSAL1                 = 23021
  SHARPENING_UNIVERSAL2                 = 23022
  SHARPENING_UNIVERSAL3                 = 23023
  
  WEAPON_POSSESSION_PLUS1               = 23030
  WEAPON_POSSESSION_PLUS2               = 23031
  WEAPON_POSSESSION_PLUS3               = 23032

  private
  
  def self.enchants_types_data
    dressrom_images = "/images/selfmodules/dressroom/"
    
    enchants_types_data = {
      EMBEDDED_HP_IN_ARMOR_HP15: {  caption: "улучшить броню +15хп",              image_link: dressrom_images + "items/spells/enhancement_of_things/charm15.gif" },
      EMBEDDED_HP_IN_ARMOR_HP25: {  caption: "улучшить броню +25хп",              image_link: dressrom_images + "items/spells/enhancement_of_things/charm25.gif" },

      EMBEDDED_HP_IN_RING_HP5: {    caption: "улучшить кольцо +5хп",              image_link: dressrom_images + "items/spells/enhancement_of_things/plusring5.png" },
      EMBEDDED_HP_IN_RING_HP10: {   caption: "улучшить кольцо +10хп",             image_link: dressrom_images + "items/spells/enhancement_of_things/plusring10.png" },
      EMBEDDED_HP_IN_RING_HP15: {   caption: "улучшить кольцо +15хп",             image_link: dressrom_images + "items/spells/enhancement_of_things/plusring15.png" },

      SHARPENING_PLUS5: {           caption: "заточка обычная +5",                image_link: dressrom_images + "items/spells/enhancement_of_things/sharpen_plus5.png" },
      SHARPENING_UNIVERSAL1: {      caption: "заточка универсальная +1",          image_link: dressrom_images + "items/spells/enhancement_of_things/sharpen_universal_6.gif" },
      SHARPENING_UNIVERSAL2: {      caption: "заточка универсальная +2",          image_link: dressrom_images + "items/spells/enhancement_of_things/sharpen_universal_7.gif" },
      SHARPENING_UNIVERSAL3: {      caption: "заточка универсальная +3",          image_link: dressrom_images + "items/spells/enhancement_of_things/sharpen_universal_8.gif" },

      WEAPON_POSSESSION_PLUS1: {    caption: "мастерство владения оружием +1",    image_link: dressrom_images + "items/spells/enhancement_of_things/improve_masters_universal_1.gif" },
      WEAPON_POSSESSION_PLUS2: {    caption: "мастерство владения оружием +2",    image_link: dressrom_images + "items/spells/enhancement_of_things/improve_masters_universal_2.gif" },
      WEAPON_POSSESSION_PLUS3: {    caption: "мастерство владения оружием +3",    image_link: dressrom_images + "items/spells/enhancement_of_things/improve_masters_universal_3.gif" }
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
    self.enchants_types_data[ self.hash.key(value) ]
  end  
end