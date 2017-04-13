class User < ApplicationRecord
  has_many :items, dependent: :destroy
  
  validates :user_name,         presence: true, length: { maximum: 50 }
  validates :joomla_user_id,    presence: true, numericality: { only_integer: true, greater_than: 0 }
        
end
