class Category < ApplicationRecord
  has_many :item_templates, dependent: :destroy
  has_many :items, through: :item_templates
  belongs_to :parent, class_name: "Category", optional: true
    
  validates :caption,           presence: true,     length: { maximum: 50 }
  validates :parent_id,         presence: true,     allow_nil: true
  validates :order,             presence: true,     numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    
  def self.parent_caption
    return "нет родителя" unless self.parent
    category.parent.caption
  end

  def self.parent_id
    return nil unless self.parent
    category.parent.id
  end
  
  def self.caption_by_id( id )
    Category.find(id).caption
  end
  
  def self.root_categories
    return Category.where(parent_id: nil).order(:order)
  end
  
  def have_children( id = nil )
    id = self.id if id.nil?
    return Category.where(parent_id: id).limit(1).count() > 0
  end
  
  def items_count( for_user_id = nil )
    items = self.items
    items = items.where(user_id: for_user_id) unless for_user_id.nil?
    items.count()
  end
  
  def self.categories_map
    map = []
    root_categories.each do |r_c|
      map.push( {id: r_c.id, caption: r_c.caption, parent_id: r_c.parent_id, have_children: r_c.have_children } )
      Category.where(parent_id: r_c.id).order(:order).each {|c| map.push( {id: c.id, caption: c.caption, parent_id: c.parent_id, have_children: c.have_children} )}
    end
    map
  end
  
end
