class AssessmentAnswersController < ApplicationController
  def create
    params[“answers”].each do |key, value|
      @assessment_answer =    AssessmentAnswer.create(assessment_answer_params(value))
    end

    respond_to do |format|
      if @assessment_answer.save
        delete_written
        format.html { redirect_to assessment_url(@assessment), notice: ‘Assessment answers were successfully created.’ }
        format.json { render :show, status: :created, location: @assessment_answer }
      else
        format.html { render :new }
        format.json { render json: @assessment_answer.errors, status: :unprocessable_entity }
      end
    end
    enddef assessment_answer_params(answers)
    answers.permit(:letter, :answer, :correct, :assessment_question_id, :assessment_id)
  end

  def delete_written
    AssessmentAnswer.where(letter: nil).delete_all
  end
end
