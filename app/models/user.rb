class User < ApplicationRecord
  has_many :groups, foreign_key: 'user_id',  dependent: :delete_all
  has_many :entities, foreign_key: 'user_id',  dependent: :delete_all


  validates :name, presence: true
end
