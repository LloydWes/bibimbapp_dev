class Vocabulary < ApplicationRecord
  belongs_to :lesson

  validates :word, presence: true
  validates :traduction, presence: true
end
