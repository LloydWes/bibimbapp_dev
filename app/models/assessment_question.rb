class AssessmentQuestion < ApplicationRecord
  has_many :assessment_options, dependent: :destroy, :inverse_of => :assessment_question
  accepts_nested_attributes_for :assessment_options
  
  has_many :assessment_answers, dependent: :destroy, :inverse_of => :assessment_question
  accepts_nested_attributes_for :assessment_answers

  belongs_to :assessment#, :inverse_of => :assessment_question
  # accepts_nested_attributes_for :assessment
end
