class Group < ApplicationRecord
  validates :name, presence: true
  validates :icon, presence: true

  belongs_to :user, class_name: 'User', foreign_key: :user_id
  has_many :group_deals
  has_many :deals, through: :group_deals
end
