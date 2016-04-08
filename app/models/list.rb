class List < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
  has_many :favorite_lists
  validates :name, :user_id, presence: true
end
