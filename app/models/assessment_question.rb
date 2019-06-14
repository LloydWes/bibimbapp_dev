class AssessmentQuestion < ApplicationRecord
  require 'csv'
  require 'activerecord-import/base'
  # require 'activerecord-import/active_record/adapters/postgresql_adapter'

  has_many :assessment_options, dependent: :destroy, :inverse_of => :assessment_question
  accepts_nested_attributes_for :assessment_options
  
  has_many :assessment_answers, dependent: :destroy, :inverse_of => :assessment_question
  accepts_nested_attributes_for :assessment_answers

  belongs_to :assessment#, :inverse_of => :assessment_question
  # accepts_nested_attributes_for :assessment

  validates :assessment_id, presence: true, allow_nil: false
  validates :question, presence: true, allow_nil: false
  validates :correct_letter, presence: true, allow_nil: false
  validates :correct_answer, presence: true, allow_nil: false
  # validates :order, presence: true, allow_nil: false
  # validates :active, presence: true, allow_nil: false

  def self.import_questions
    # questions = Array.new()
    lesson = Array.new()
    Lesson.all.select(:id).each do |id|
      lesson << id.id
    end
    puts lesson.inspect
    CSV.foreach('public/questions.csv', headers: false) do |row|
      # print "#{Assessment.find_by(lesson_id:lesson[row[0].to_i-1]).id} #{row[2]} #{row[3]} #{row[4]}\n"
      AssessmentQuestion.create!(assessment_id: Assessment.find_by(lesson_id:lesson[row[0].to_i-1]).id, question: row[2], correct_letter: row[3], correct_answer: row[4])
    end
  end
end
