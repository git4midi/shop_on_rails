module ApplicationHelper

  def pagination_default_data_hash
    data_hash = { scroll_top: true }
    data_hash[:show_compact] = @show_compact if @show_compact == true
    data_hash[:items_caption] = u @items_caption unless @items_caption.nil?
    data_hash
  end
  
  def items_count_pagination(path)
    data_hash = pagination_default_data_hash
    pagination = "<div><span class='jsn-mini-icon'>&#58954;</span> "
    [20, 30, 50].each do |num|
      data_hash["items-count-pagination"] = num
      pagination += link_to( num, path, method: :get, remote: @use_remote, format: @response_format, data: data_hash ) + " "
     end
    #"<a items-count-pagination>10</a> <a items-count-pagination>20</a> <a items-count-pagination>30</a></div>".html_safe
    pagination += "</div>"
    pagination.html_safe
  end

  def pages_pagination(path, nodes_count, nodes_on_page, nodes_start)
    nodes_on_page = nodes_count if nodes_on_page.nil?
    
    pages_count = (1.0 * nodes_count / nodes_on_page).ceil
    pages_count = 1 if pages_count == 0
    current_page = ( nodes_start / nodes_on_page) + 1
    
    pages = []
    range = 3
    for i in 1..pages_count do
      if( (i <= range) || ( (i >= current_page - range/2) && (i <= current_page + range/2) ) || (i > pages_count - range)  ) then
        pages << "..." if !pages.empty? && i != pages.last + 1
        pages << i
      end
    end

    data_hash = pagination_default_data_hash
    
    pagination =  "<div class='pages-pagination'><span class='jsn-mini-icon'>&#59012;</span> "
    pages.each do |num|
      if num.is_a? Numeric
        data_hash["start-pagination"] = nodes_on_page*(num-1)
        pagination += link_to( num, path, method: :get, remote: @use_remote, format: @response_format, data: data_hash ) + " "
      else
        pagination += "<span class='pagination-gap'>"+ num.to_s + "</span> "
      end
    end
    pagination += "<span class='jsn-mini-icon'>&#59012;</span></div>"  
    pagination.html_safe
  end
      
end
