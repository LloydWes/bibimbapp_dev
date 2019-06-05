class Level < ApplicationRecord
  has_many :lessons
  has_many :users

  validates :niveau, presence: true
end
