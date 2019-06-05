class Level < ApplicationRecord
  has_many :lessons
  has_many :users
end
