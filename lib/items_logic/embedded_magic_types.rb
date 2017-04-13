class EmbeddedMagicTypes
  MAGIC_WITHOUT_MAGIC             = 21100
  MAGIC_CURE20HP                  = 21101
  MAGIC_CURE35HP                  = 21102
  MAGIC_CURE50HP                  = 21103
  MAGIC_MIRROR                    = 21110
  MAGIC_ANTIMIRROR                = 21120
  MAGIC_CLOSEBATTLE               = 21130
  MAGIC_UNLOCKBATTLE              = 21140
  MAGIC_REANIMATION               = 21150
  MAGIC_POISON                    = 21160
  MAGIC_POISONECR                 = 21161
  MAGIC_COMMENT                   = 21170
  
  MAGIC_DODGE                     = 21200
  MAGIC_ANTIDODGE                 = 21210
  MAGIC_CRIT                      = 21220
  MAGIC_ANTICRIT                  = 21230
  MAGIC_ARMOR                     = 21240
  MAGIC_DAMAGE                    = 21250
  MAGIC_CRUSH                     = 21260
  MAGIC_PROTECTION_FROM_WEAPON    = 21270
  
  private
  
  def self.magic_types_data
    dressrom_images = "/images/selfmodules/dressroom/"
    
    magic_types_data = {
      MAGIC_WITHOUT_MAGIC: {      caption: "без магии",                     image_link: "without_magic" },
      MAGIC_CURE20HP: {           caption: "исцеление +20%",                image_link: dressrom_images + "items/spells/combat_and_protective/cureHP15.gif" },
      MAGIC_CURE35HP: {           caption: "исцеление +35%",                image_link: dressrom_images + "items/spells/combat_and_protective/cureHP45.gif" },
      MAGIC_CURE50HP: {           caption: "исцеление +50%",                image_link: dressrom_images + "items/spells/combat_and_protective/cureHP60.gif" },
      MAGIC_MIRROR: {             caption: "порождение клона",              image_link: dressrom_images + "items/spells/combat_and_protective/mirror.gif" },
      MAGIC_ANTIMIRROR: {         caption: "переманить клона",              image_link: dressrom_images + "items/spells/combat_and_protective/antimirror.gif" },
      MAGIC_CLOSEBATTLE: {        caption: "закрыть бой",                   image_link: dressrom_images + "items/spells/combat_and_protective/closebattle.gif" },
      MAGIC_UNLOCKBATTLE: {       caption: "открыть бой",                   image_link: dressrom_images + "items/spells/combat_and_protective/unlockbattle.gif" },
      MAGIC_REANIMATION: {        caption: "поднять мертвого",              image_link: dressrom_images + "items/spells/combat_and_protective/reanimationD.gif" },
      MAGIC_POISON: {             caption: "поцелуй ведьмы",                image_link: dressrom_images + "items/spells/combat_and_protective/poison.gif" },
      MAGIC_POISONECR: {          caption: "объятия смерти",                image_link: dressrom_images + "items/spells/combat_and_protective/poison_e.gif" },
      MAGIC_COMMENT: {            caption: "оставить запись в логе боя",    image_link: dressrom_images + "items/spells/neutral/note.gif" }
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
    self.magic_types_data[ self.hash.key(value) ]
  end
  
end