class Deal < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :group_deals
  has_many :groups, through: :group_deals

  validates :amount, presence: true, numericality: { greater_than: 0 }
end
