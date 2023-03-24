class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :full_name, presence: true

  has_many :groups, class_name: 'Group', foreign_key: :user_id
  has_many :deals, class_name: 'Deal', foreign_key: :author_id
end
