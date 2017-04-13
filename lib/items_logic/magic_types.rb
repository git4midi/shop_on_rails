class MagicTypes
  MAGIC_WITHOUT_MAGIC             = 21100;
  MAGIC_CURE20HP                  = 21101;
  MAGIC_CURE35HP                  = 21102;
  MAGIC_CURE50HP                  = 21103;
  MAGIC_MIRROR                    = 21110;
  MAGIC_ANTIMIRROR                = 21120;
  MAGIC_CLOSEBATTLE               = 21130;
  MAGIC_UNLOCKBATTLE              = 21140;
  MAGIC_REANIMATION               = 21150;
  MAGIC_POISON                    = 21160;
  MAGIC_POISONECR                 = 21161;
  MAGIC_COMMENT                   = 21170;
  MAGIC_DODGE                     = 21200;
  MAGIC_ANTIDODGE                 = 21210;
  MAGIC_CRIT                      = 21220;
  MAGIC_ANTICRIT                  = 21230;
  MAGIC_ARMOR                     = 21240;
  MAGIC_DAMAGE                    = 21250;
  MAGIC_CRUSH                     = 21260;
  MAGIC_PROTECTION_FROM_WEAPON    = 21270;
  
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