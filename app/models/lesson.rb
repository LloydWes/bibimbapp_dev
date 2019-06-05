class Lesson < ApplicationRecord
  belongs_to :level
  has_many :vocabularies
  has_many :results

end
