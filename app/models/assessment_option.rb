class AssessmentOption < ApplicationRecord
  require 'csv'
  require 'activerecord-import/base'

  belongs_to :assessment_question, :inverse_of => :assessment_options
  accepts_nested_attributes_for :assessment_question

  belongs_to :assessment

  validates :assessment_id, presence: true, allow_nil: false
  validates :assessment_question_id, presence: true, allow_nil: false
  validates :letter, presence: true, allow_nil: false
  validates :answer, presence: true, allow_nil: false

  def self.import_options
    # questions = Array.new()
    question = Array.new()
    assessment = Array.new()
    AssessmentQuestion.all.select(:id).each do |id|
      question << id.id
    end
    Assessment.all.select(:id).each do |id|
      assessment << id.id
    end
    # puts assessment.inspect, ""
    # puts question.inspect
    current_question = nil
    CSV.foreach('public/options.csv', headers: false) do |row|
      # print "#{Assessment.find_by(lesson_id:lesson[row[0].to_i-1]).id} #{row[2]} #{row[3]} #{row[4]}\n"
      current_question = AssessmentQuestion.find(question[row[0].to_i-1]) 
      # puts row.inspect
      # puts current_question
      AssessmentOption.create!(assessment_question_id: current_question.id, assessment_id: current_question.assessment.id, letter: row[1], answer: row[2])
    end
  end

end
