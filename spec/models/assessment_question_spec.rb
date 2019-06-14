require 'rails_helper'

RSpec.describe AssessmentQuestion, type: :model do

  before(:each) do 
    @assessment = Assessment.create(lesson_id: Lesson.all.sample.id, attempt_limit: 10)
    @assessment_question = AssessmentQuestion.create(active: true, order: 10, question: 'Hop hop hop', correct_letter: 'a', correct_answer: "Merci d'avoir lu ce code jusqu'ici", assessment_id: @assessment.id)
  end


  context "validation" do

    it "is valid with valid attributes" do
      expect(@assessment).to be_a(Assessment)
      expect(@assessment).to be_valid
      expect(@assessment_question).to be_a(AssessmentQuestion)
      expect(@assessment_question).to be_valid
    end

    describe "#assessment_question" do
      it "should not be valid without a assessment_id" do
        bad_assessment_question = AssessmentQuestion.create(active: true, order: 10, question: 'Hop hop hop', correct_letter: 'a', correct_answer: "Merci d'avoir lu ce code jusqu'ici")
        expect(bad_assessment_question).not_to be_valid
        expect(bad_assessment_question.errors.include?(:assessment_id)).to eq(true)
      end
    end

    describe "#assessment_question" do
      it "should not be valid without a correct_letter" do
        bad_assessment_question = AssessmentQuestion.create(active: true, order: 10, question: 'Hop hop hop', correct_answer: "Merci d'avoir lu ce code jusqu'ici", assessment_id: @assessment.id)
        expect(bad_assessment_question).not_to be_valid
        expect(bad_assessment_question.errors.include?(:correct_letter)).to eq(true)
      end
    end

    describe "#assessment_question" do
      it "should not be valid without a correct_answer" do
        bad_assessment_question = AssessmentQuestion.create(active: true, order: 10, question: 'Hop hop hop', correct_letter: 'a', assessment_id: @assessment.id)
        expect(bad_assessment_question).not_to be_valid
        expect(bad_assessment_question.errors.include?(:correct_answer)).to eq(true)
      end
    end
    
  end

  context "associations" do
    describe "assessments should belongs_to assesment" do
      it "should belongs_to assessment" do
        expect(@assessment_question.assessment).to eq(@assessment)
      end
    end

    describe "assessments should have many assesment options" do
      it "should has_many assessment options" do
        assessment_option = AssessmentOption.create(letter: 'a', answer: 'Vous êtes encore là?', assessment_question_id: @assessment_question.id, assessment_id: @assessment.id)
        expect(@assessment_question.assessment_options.include?(assessment_option)).to eq(true)
      end
    end
  end

end