class AssessmentOption < ApplicationRecord
  belongs_to :assessment_question, :inverse_of => :assessment_options
  accepts_nested_attributes_for :assessment_question

  belongs_to :assessment

end
