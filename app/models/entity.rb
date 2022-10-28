class Entity < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :group, class_name: 'Group', foreign_key: 'group_id'

  validates :name, presence: true, length: { in: 3..250 }
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
