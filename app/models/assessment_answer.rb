class AssessmentAnswer < ApplicationRecord
  # belongs_to :assessment#, :inverse_of => :assessment_answers
  # accepts_nested_attributes_for :assessment

  belongs_to :assessment_question, :inverse_of => :assessment_answers
  accepts_nested_attributes_for :assessment_question

  belongs_to :user
  belongs_to :assessment
end
