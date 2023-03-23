class Deal < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :group_deals
  has_many :groups, through: :group_deals

  # validate :at_least_one_group
  
  # private

  # def at_least_one_group
  #   errors.add(:base, "Pleasssssssse select at least one group") unless group_ids.any?
  # end
end
