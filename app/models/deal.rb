class Deal < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :category, class_name: 'Category', foreign_key: :category_id
end
