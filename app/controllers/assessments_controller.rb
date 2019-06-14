class AssessmentsController < ApplicationController
 before_action :authenticate_user!

 def index
 end

 def new
  puts "*"*60, params.inspect, "*"*60
  @questions = Assessment.where(lesson_id: params[:lesson_id]).first.assessment_questions
  @attempt_n = getAttemptNumber(Assessment.last.id)

end

def create
    # puts "*"*60, params.inspect
    assessment_id = nil
    assessment_answers = Array.new()

    #Get every question_id and option_id in a hash {question_id => option_id} and the assessment_id
    params.each_pair do |key, value|
      if key.index('assessment_id')
        assessment_id = value.to_i
      elsif key.index('question_id') != nil && value.index('option_id') != nil
        assessment_answers << {key.split('_').last.to_i => value.split('_').last.to_i}
      else
        # puts "ERROR for #{key}=>#{value}"
      end
    end

    #Make sure we found the assessment_id and that at least one answer has been found
    if !(assessment_answers.length > 0) || assessment_id == nil
      # puts "-~#"*20, 'ERROR'
    end

    # Make sure that every answer has been answered (send on error page otherwise with flash)

    option = nil
    question = nil
    
    # Get the current attempt for the assessment
    attempt = nil
    attempt = getAttemptNumber(assessment_id)
    attempt += 1
    # Make sure the attempt isn't exceding the limit
    # if attempt > Assessment.find(assessment_id).attempt_limit
      # redirect_to controller: 'user_assessment_attempts', action: 'attempt_limit'
      # redirect_to controller: 'user_assessment_attempts', action: 'attempt_limit'
    # end

    #Assessment_anwsers is an array, each case contains a hash {question_id => option_id}
    correct = nil
    number_of_correct_answer = 0
    assessment_answers.each do |pair|
      pair.each_pair do |key, value|
        question = AssessmentQuestion.find(key.to_i)
        option = AssessmentOption.find(value.to_i)
      end

      #Raise an error if either question_id or option_id don't exist
      if question == nil || option == nil

      end
      puts "-----------"*10, question.correct_letter, option.letter, '______________'*10
      # Check if the answer is correct
      if option.letter == question.correct_letter
        correct = true
        number_of_correct_answer += 1
      else
        puts 'EEEEEEEEEEELLLLLLLLLLLLLLLLLLLLLLLLLLSSSSSSSSSSSSSSSSSSSSSSSSSSSEEEEEEEEEEEEEEEEEEEEEEEEEEEEE'
        correct = false
      end
      puts correct

      #Prepare to catch exeception if an error occurs during the entry creation
      begin
        AssessmentAnswer.create!(
          letter: option.letter,
          answer: option.answer,
          attempt_number: attempt,
          correct: correct,
          assessment_question_id: question.id,
          assessment_id: assessment_id,
          user_id: current_user.id
          )
      rescue ActiveRecord::RecordInvalid => e
        puts "Error: #{e}", correct
      end

    end
      # Create result entry
      number_of_questions = assessment_answers.length
      score =  ((number_of_correct_answer.to_f / number_of_questions.to_f) * 100).to_i
      puts "#"*20, number_of_correct_answer, number_of_questions, score
      is_past = false
      score >= 80 ? is_past = true : false
      begin
        Result.create!(is_past?: is_past, score: score, date_exam: Date.today, lesson_id: params[:lesson_id], user_id: current_user.id)
      rescue ActiveRecord::RecordInvalid => e
        puts "Error: #{e}", correct
      end

    # redirect_to 'user_assessment_attempt#show' with proper parameters to display the results
    redirect_to controller: 'assessments', action: 'show', lesson_id: Assessment.find(assessment_id).lesson.id, id: assessment_id, attempt: attempt
  end

  def show
    # Make sure the user passed the test he is trying to view

    # Get the attempt number
    @attempt = getAttemptNumber(params[:id])

    # Get the correct assessment
    assessment = Assessment.find(params[:id])
    # Get the correct assessments questions
    @questions = assessment.assessment_questions

    # Get the correct options (actually useless)
    # @options = Array.new()
    # @questions.each do |question|
    #   @options << question.assessments_options
    # end

    # Get the correct answers
    @answers = AssessmentAnswer.where(assessment_id: params[:id], user_id: current_user.id, attempt_number: params[:attempt])
    puts "#"*20, @answers ,"#-"*20
    

  end

  private

  # def attempt_limit 
  # end

  #Make it a helper
  def getAttemptNumber(assessment_id)
    # puts "-*"*20, "attempt"
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
