class Group < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :entities, foreign_key: 'group_id', dependent: :delete_all

  validates :name, presence: true, length: {in: 3..200}
end
