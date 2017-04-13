class ResponseToJoomla

  attr_writer :html_content
    
  private
  attr_reader   :html_content
  attr_accessor :to_append
  attr_accessor :to_replace
  attr_accessor :to_remove
  attr_accessor :notice

  public  
  def initialize
    @html_content = ""
    @notice = {}
    @to_append = {}
    @to_replace = {}
    @to_remove = []
  end
  
  def set_notice( message, notice_level = Notice::SIMPLE )
    case notice_level
    when Notice::SIMPLE
      level = 'simple'
    when Notice::SUCCESS
      level = 'success'
    when Notice::WARNING
      level = 'warning'
    when Notice::ERROR
      level = 'error'
    else
      raise "undefined notice_level, value=#{notice_level}"
    end
    
    notice['level'] = level
    notice['message'] = message
  end

  def add_to_append( key, value )
    to_append[key] = value;
  end
  
  def add_to_replace( key, value )
    to_replace[key] = value;
  end

  def add_to_remove( value )
    to_remove << value;
  end
  
  def get_response_hash
    { html_content: html_content,
      notice:       notice,
      append:       to_append,
      replace:      to_replace,
      remove:       to_remove }
  end
  
end