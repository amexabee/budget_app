class Category < ApplicationRecord
  validates :name, presence: true
  validates :icon, presence: true

  belongs_to :user, class_name: 'User', foreign_key: :user_id
  has_many :deals, class_name: 'Deal', foreign_key: :category_id
end
