class DataHash
  private
    attr_accessor :data_hash
    attr_accessor :prefix 
    
  public
  
  def initialize(data_hash, prefix = self.class.to_s )
    raise "'#{data_hash}' isn't Hash, #{data_hash}.class = #{data_hash.class}" unless data_hash.class == Hash

    @prefix = prefix.nil? ? prefix : self.class.normalize_str(prefix)
        
    @data_hash = data_hash
    @data_hash.each_key do |key|
      define_singleton_method(key) do
        @data_hash[key]
      end
      
      define_singleton_method(key.to_s+"=") do |value|
        @data_hash[key]  = value
      end
    end
  end
  
  def [](key)
    check_key key
    data_hash[key]
  end

  def []=(key, value)
    check_key key
    data_hash[key] = value
  end

  def keys
      data_hash.keys
  end
  
  def has_key?(key)
    data_hash.has_key?(key)
  end

  def hash(recursive = false, use_prefix = false)
    hash = {}
    data_hash.keys.each do |key|
      if (data_hash[key].class.superclass == DataHash) && recursive then
        hash[key] = data_hash[key].hash(recursive, use_prefix)
      else
        hash[ result_key(key, use_prefix) ] = data_hash[key]
      end
    end
    hash
  end

  def hash_flatten(recursive = false, use_prefix = false)
    hash = {}
    data_hash.keys.each do |key|
      if (data_hash[key].class.superclass == DataHash) && recursive then
        data_hash[key].hash_flatten(recursive, use_prefix).each {|k, v| hash[k] = v }
      else
        hash[ result_key(key, use_prefix) ] = data_hash[key]
      end
    end
    hash
  end
  
  def flatten(recursive = false, use_prefix = false)
    hash_flatten(recursive, use_prefix).keys
  end
        
  private
  
  def check_key(key)
    raise "Wrong key '#{key}' for #{self}, valid keys: #{self.keys.inspect}" unless self.has_key?(key)
  end
  
  def result_key(key, use_prefix = false)
    if use_prefix then
      if prefix.nil? then
        key.to_s
      else
        prefix + "_" + key.to_s
      end
    else
      key.to_s
    end
  end
  
  def self.normalize_str(str)
    new_str = str
    new_str = str.gsub(/[A-Z]/) {|match| "_"+ match.downcase }
    new_str = new_str.slice(1, new_str.size-1) if new_str[0] == "_"
    new_str
  end
 
end