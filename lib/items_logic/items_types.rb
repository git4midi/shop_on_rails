class ItemsTypes
  ITEM_TYPE_WITHOUT_TYPE        = 0
  
  ITEM_TYPE_SHIRT               = 20010
  ITEM_TYPE_CLOAK               = 20020
  
  ITEM_TYPE_MAGIC               = 20030
  ITEM_TYPE_EARRINGS            = 20040
  ITEM_TYPE_NECKLACE            = 20050
  ITEM_TYPE_WEAPON_KNIFE        = 20060
  ITEM_TYPE_WEAPON_AXE          = 20061
  ITEM_TYPE_WEAPON_CLUB         = 20062
  ITEM_TYPE_WEAPON_SWORD        = 20063
  ITEM_TYPE_WEAPON_BOUQUET      = 20064
  ITEM_TYPE_WEAPON_STAFF        = 20065
  ITEM_TYPE_ARMOR_LIGHT         = 20070
  ITEM_TYPE_ARMOR_HEAVY         = 20071
  ITEM_TYPE_RING                = 20080
  ITEM_TYPE_HELMET              = 20090
  ITEM_TYPE_GLOVES              = 20100
  ITEM_TYPE_SHIELD              = 20110
  ITEM_TYPE_BOOTS               = 20120
  ITEM_TYPE_RUNE                = 20130
  ITEM_TYPE_ORB                 = 20140
  
  ITEM_TYPE_STATS_ELIX          = 20150
  ITEM_TYPE_BATTLE_ELIX         = 20160
  ITEM_TYPE_POTION              = 20170
  ITEM_TYPE_CARDDECK            = 20180
  ITEM_TYPE_CAST                = 20190
  
  ITEM_TYPE_BONUS_FROM_STATS    = 20200;
  
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

  def self.description_hash
    hash = {}
    hash[:ITEM_TYPE_WITHOUT_TYPE] =       {value: self[:ITEM_TYPE_WITHOUT_TYPE],      caption: "без типа" }

    hash[:ITEM_TYPE_SHIRT] =              {value: self[:ITEM_TYPE_SHIRT],             caption: "тельник" }
    hash[:ITEM_TYPE_CLOAK] =              {value: self[:ITEM_TYPE_CLOAK],             caption: "плащ" }

    hash[:ITEM_TYPE_MAGIC] =              {value: self[:ITEM_TYPE_MAGIC],             caption: "магия" }
    hash[:ITEM_TYPE_EARRINGS] =           {value: self[:ITEM_TYPE_EARRINGS],          caption: "серьги" }
    hash[:ITEM_TYPE_NECKLACE] =           {value: self[:ITEM_TYPE_NECKLACE],          caption: "амулет" }
    hash[:ITEM_TYPE_WEAPON_KNIFE] =       {value: self[:ITEM_TYPE_WEAPON_KNIFE],      caption: "кастет, нож" }
    hash[:ITEM_TYPE_WEAPON_AXE] =         {value: self[:ITEM_TYPE_WEAPON_AXE],        caption: "топор" }
    hash[:ITEM_TYPE_WEAPON_CLUB] =        {value: self[:ITEM_TYPE_WEAPON_CLUB],       caption: "дубина, булава" }
    hash[:ITEM_TYPE_WEAPON_SWORD] =       {value: self[:ITEM_TYPE_WEAPON_SWORD],      caption: "меч" }
    hash[:ITEM_TYPE_WEAPON_BOUQUET] =     {value: self[:ITEM_TYPE_WEAPON_BOUQUET],    caption: "букет" }
    hash[:ITEM_TYPE_WEAPON_STAFF] =       {value: self[:ITEM_TYPE_WEAPON_STAFF],      caption: "посох" }
    hash[:ITEM_TYPE_ARMOR_LIGHT] =        {value: self[:ITEM_TYPE_ARMOR_LIGHT],       caption: "легкая броня" }
    hash[:ITEM_TYPE_ARMOR_HEAVY] =        {value: self[:ITEM_TYPE_ARMOR_HEAVY],       caption: "тяжелая броня" }
    hash[:ITEM_TYPE_RING] =               {value: self[:ITEM_TYPE_RING],              caption: "кольцо" }
    hash[:ITEM_TYPE_HELMET] =             {value: self[:ITEM_TYPE_HELMET],            caption: "шлем" }
    hash[:ITEM_TYPE_GLOVES] =             {value: self[:ITEM_TYPE_GLOVES],            caption: "перчи" }
    hash[:ITEM_TYPE_SHIELD] =             {value: self[:ITEM_TYPE_SHIELD],            caption: "щит" }
    hash[:ITEM_TYPE_BOOTS] =              {value: self[:ITEM_TYPE_BOOTS],             caption: "сапоги" }
    hash[:ITEM_TYPE_RUNE] =               {value: self[:ITEM_TYPE_RUNE],              caption: "руна" }
    hash[:ITEM_TYPE_ORB] =                {value: self[:ITEM_TYPE_ORB],               caption: "орб" }

    hash[:ITEM_TYPE_STATS_ELIX] =         {value: self[:ITEM_TYPE_STATS_ELIX],        caption: "статовый эликсир" }
    hash[:ITEM_TYPE_BATTLE_ELIX] =        {value: self[:ITEM_TYPE_BATTLE_ELIX],       caption: "боевой эликсир" }
    hash[:ITEM_TYPE_POTION] =             {value: self[:ITEM_TYPE_POTION],            caption: "зелье" }
    hash[:ITEM_TYPE_CARDDECK] =           {value: self[:ITEM_TYPE_CARDDECK],          caption: "колода карт" }
    hash[:ITEM_TYPE_CAST] =               {value: self[:ITEM_TYPE_CAST],              caption: "каст" }

    hash[:ITEM_TYPE_BONUS_FROM_STATS] =   {value: self[:ITEM_TYPE_BONUS_FROM_STATS],  caption: "статовый бонус" }
    hash
  end
  
  def self.two_handed_valid_types_hash
    hash = {}
    hash[:ITEM_TYPE_WEAPON_KNIFE] =       self[:ITEM_TYPE_WEAPON_KNIFE]
    hash[:ITEM_TYPE_WEAPON_AXE] =         self[:ITEM_TYPE_WEAPON_AXE]
    hash[:ITEM_TYPE_WEAPON_CLUB] =        self[:ITEM_TYPE_WEAPON_CLUB]
    hash[:ITEM_TYPE_WEAPON_SWORD] =       self[:ITEM_TYPE_WEAPON_SWORD]
    hash[:ITEM_TYPE_WEAPON_BOUQUET] =     self[:ITEM_TYPE_WEAPON_BOUQUET]
    hash[:ITEM_TYPE_WEAPON_STAFF] =       self[:ITEM_TYPE_WEAPON_STAFF]
    hash
  end
  
  def self.sharpening_valid_types_hash
    hash = {}
    hash[:ITEM_TYPE_WEAPON_KNIFE] =       self[:ITEM_TYPE_WEAPON_KNIFE]
    hash[:ITEM_TYPE_WEAPON_AXE] =         self[:ITEM_TYPE_WEAPON_AXE]
    hash[:ITEM_TYPE_WEAPON_CLUB] =        self[:ITEM_TYPE_WEAPON_CLUB]
    hash[:ITEM_TYPE_WEAPON_SWORD] =       self[:ITEM_TYPE_WEAPON_SWORD]
    hash
  end

  def self.can_be_two_handed?(item_type)
    self.two_handed_valid_types_hash.value?(item_type)
  end
  
  def self.can_be_sharpened?(item_type)
    self.sharpening_valid_types_hash.value?(item_type)
  end
  
end