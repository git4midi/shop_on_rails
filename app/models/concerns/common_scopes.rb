module CommonScopes
  extend ActiveSupport::Concern

  included do
    scope  :use_items_count, ->(items_count_on_page) { limit(items_count_on_page) unless items_count_on_page.nil? }
    scope  :use_items_start, ->(items_start) { offset(items_start) unless items_start.nil? }
    scope  :use_pages_limits, ->(items_count_on_page, items_start) { use_items_count(items_count_on_page).use_items_start(items_start) }
  end

end