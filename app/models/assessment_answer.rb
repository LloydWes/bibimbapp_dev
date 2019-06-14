class AssessmentAnswer < ApplicationRecord
  # belongs_to :assessment#, :inverse_of => :assessment_answers
  # accepts_nested_attributes_for :assessment

  belongs_to :assessment_question, :inverse_of => :assessment_answers
  accepts_nested_attributes_for :assessment_question

  belongs_to :user
  belongs_to :assessment

  validates :assessment_id, presence: true, allow_nil: false
  validates :assessment_question_id, presence: true, allow_nil: false
  validates :letter, presence: true, allow_nil: false
  validates :answer, presence: true, allow_nil: false
  validates :attempt_number, presence: true, allow_nil: false
  # validates :correct, presence: true, allow_nil: false
  # validates :correct, inclusion: {in: [false, true], message: "%{attribute} must be true or false"}
  validates :user_id, presence: true, allow_nil: false

  
end
