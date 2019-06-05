class Result < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  validates :user_id, presence: true, allow_nil: false
  validates :lesson_id, presence: true, allow_nil: false
  validates :is_past?, inclusion: {in: [false, true]}
  validates :score, presence: true, allow_nil: false
  validates :date_exam, presence: true, allow_nil: false
end
