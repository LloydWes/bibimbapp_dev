class Assessment < ApplicationRecord
  has_many :assessment_questions, dependent: :destroy#, :inverse_of => :assessment
  belongs_to :lesson
  has_many :assessment_options
  has_many :assessment_answers
  # has_many :assessment_answers
  # accepts_nested_attributes_for :assessment_questions
  validates :lesson_id, presence: true, allow_nil: false
  validates :attempt_limit, presence: true, allow_nil: false 

  def self.create_assessment
    Lesson.all.each do |lesson|
      Assessment.create(lesson_id: lesson.id, attempt_limit: 10)
    end
  end
end
