class AssessmentOption < ApplicationRecord
  belongs_to :assessment_question, :inverse_of => :assessment_options
  accepts_nested_attributes_for :assessment_question

  belongs_to :assessment

  validates :assessment_id, presence: true, allow_nil: false
  validates :assessment_question_id, presence: true, allow_nil: false
  validates :letter, presence: true, allow_nil: false
  validates :answer, presence: true, allow_nil: false

end
