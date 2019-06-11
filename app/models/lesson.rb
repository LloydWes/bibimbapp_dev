class Lesson < ApplicationRecord
  belongs_to :level
  has_many :vocabularies
  has_many :results
  has_many :assessments

  validates :order, presence: true
  validates :title, presence: true
  validates :script, presence: true
  validates :grammar, presence: true
  # validates :media, presence: true
end
