class LessonsController < ApplicationController
  # layout false, only: [:index]
  before_action :authenticate_user!

  def index
    @lessons = Lesson.all
    @levels = Level.all
  end

  def show
    @lesson = Lesson.find(params[:id])
    @assessment = Assessment.find_by(lesson_id: params[:id])
    if @assessment != nil
      @assessment_attempts = Array.new()
      @number_of_attempts = getAttemptNumber(@assessment.id)    
      for i in (1..@number_of_attempts)
        @assessment_attempts << @assessment.assessment_answers.where(user_id: current_user.id, attempt_number: i)
      end
    end
  end

  private

  #Make it a helper
  def getAttemptNumber(assessment_id)
    assessments_answers = AssessmentAnswer.where(user_id: current_user.id, assessment_id: assessment_id)
    if assessments_answers != nil && assessments_answers.length > 0
      assessments_answers = assessments_answers.order(attempt_number: :desc)
      if assessments_answers.first.attempt_number != nil
        assessments_answers.first.attempt_number
      else
        0
      end
    else
      # puts "Assessment_answer is nil"
      0
    end
  end
end
