require 'rails_helper'

RSpec.describe AssessmentAnswer, type: :model do

  before(:each) do 
    @assessment = Assessment.create(lesson_id: Lesson.all.sample.id, attempt_limit: 10)
    @assessment_question = AssessmentQuestion.create(active: true, order: 10, question: 'Hop hop hop', correct_letter: 'a', correct_answer: "Merci d'avoir lu ce code jusqu'ici", assessment_id: @assessment.id)
    @user = User.create(first_name: "John", last_name: "Doe", password: 'password', password_confirmation: 'password', email: 'john.doe@yopmail.com', gender: 'male', date_of_birth: Date.today-200,is_admin?: false, level_id: 1000)
    @assessment_answer = AssessmentAnswer.create(user_id: @user.id,attempt_number: 10, assessment_question_id: @assessment_question.id, assessment_id: @assessment.id, letter: 'a', answer: 'Waou', correct: true)
  end


  context "validation" do

    it "is valid with valid attributes" do
      expect(@assessment).to be_a(Assessment)
      expect(@assessment).to be_valid
      expect(@assessment_question).to be_a(AssessmentQuestion)
      expect(@assessment_question).to be_valid
      expect(@assessment_answer).to be_a(AssessmentAnswer)
      expect(@assessment_answer).to be_valid
    end

    describe "#assessment_answer" do
      it "should not be valid without a assessment_id" do
        bad_assessment_answer = AssessmentAnswer.create(user_id: @user.id,attempt_number: 10, assessment_question_id: @assessment_question.id, letter: 'a', answer: 'Waou', correct: true)
        expect(bad_assessment_answer).not_to be_valid
        expect(bad_assessment_answer.errors.include?(:assessment_id)).to eq(true)
      end
    end

    describe "#assessment_answer" do
      it "should not be valid without a assessment_question_id" do
        bad_assessment_answer = AssessmentAnswer.create(user_id: @user.id,attempt_number: 10, assessment_id: @assessment.id, letter: 'a', answer: 'Waou', correct: true)
        expect(bad_assessment_answer).not_to be_valid
        expect(bad_assessment_answer.errors.include?(:assessment_question_id)).to eq(true)
      end
    end

    describe "#assessment_answer" do
      it "should not be valid without a letter" do
        bad_assessment_answer = AssessmentAnswer.create(user_id: @user.id,attempt_number: 10, assessment_question_id: @assessment_question.id, assessment_id: @assessment.id, answer: 'Waou', correct: true)
        expect(bad_assessment_answer).not_to be_valid
        expect(bad_assessment_answer.errors.include?(:letter)).to eq(true)
      end
    end

    describe "#assessment_answer" do
      it "should not be valid without a answer" do
        bad_assessment_answer = AssessmentAnswer.create(user_id: @user.id,attempt_number: 10, assessment_question_id: @assessment_question.id, assessment_id: @assessment.id, letter: 'a', correct: true)
        expect(bad_assessment_answer).not_to be_valid
        expect(bad_assessment_answer.errors.include?(:answer)).to eq(true)
      end
    end
    describe "#assessment_answer" do
      it "should not be valid without  correct" do
        bad_assessment_answer = AssessmentAnswer.create(user_id: @user.id,attempt_number: 10, assessment_question_id: @assessment_question.id, assessment_id: @assessment.id, letter: 'a', answer: 'Waou')
        expect(bad_assessment_answer).not_to be_valid
        expect(bad_assessment_answer.errors.include?(:correct)).to eq(true)
      end
    end

    describe "#assessment_answer" do
      it "should not be valid without a user" do
        bad_assessment_answer = AssessmentAnswer.create(attempt_number: 10, assessment_question_id: @assessment_question.id, assessment_id: @assessment.id, letter: 'a', answer: 'Waou', correct: true)
        expect(bad_assessment_answer).not_to be_valid
        expect(bad_assessment_answer.errors.include?(:user_id)).to eq(true)
      end
    end
  end

  context "associations" do
    describe "assessments_option should belongs_to assesment_question" do
      it "should belongs_to assessment question" do
        expect(@assessment_answer.assessment_question).to eq(@assessment_question)
      end
    end

    describe "assessments_option should belongs_to assesment" do
      it "should belongs_to assessment question" do
        expect(@assessment_answer.assessment).to eq(@assessment)
      end
    end
  end

end