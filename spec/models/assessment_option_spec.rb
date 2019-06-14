require 'rails_helper'

RSpec.describe AssessmentOption, type: :model do

  before(:each) do 
    @assessment = Assessment.create(lesson_id: Lesson.all.sample.id, attempt_limit: 10)
    @assessment_question = AssessmentQuestion.create(active: true, order: 10, question: 'Hop hop hop', correct_letter: 'a', correct_answer: "Merci d'avoir lu ce code jusqu'ici", assessment_id: @assessment.id)
    @assessment_option = AssessmentOption.create(letter: 'a', answer: 'Waou', assessment_question_id: @assessment_question.id, assessment_id: @assessment.id)
  end


  context "validation" do

    it "is valid with valid attributes" do
      expect(@assessment).to be_a(Assessment)
      expect(@assessment).to be_valid
      expect(@assessment_question).to be_a(AssessmentQuestion)
      expect(@assessment_question).to be_valid
      expect(@assessment_option).to be_a(AssessmentOption)
      expect(@assessment_option).to be_valid
    end

    describe "#assessment_option" do
      it "should not be valid without a assessment_id" do
        bad_assessment_option = AssessmentOption.create(letter: 'a', answer: 'Waou', assessment_question_id: @assessment_question.id)
        expect(bad_assessment_option).not_to be_valid
        expect(bad_assessment_option.errors.include?(:assessment_id)).to eq(true)
      end
    end
    
    describe "#assessment_option" do
      it "should not be valid without a assessment_question_id" do
        bad_assessment_option = AssessmentOption.create(letter: 'a', answer: 'Waou', assessment_id: @assessment.id)
        expect(bad_assessment_option).not_to be_valid
        expect(bad_assessment_option.errors.include?(:assessment_question_id)).to eq(true)
      end
    end

    describe "#assessment_option" do
      it "should not be valid without a letter" do
        bad_assessment_option = AssessmentOption.create(answer: 'Waou', assessment_question_id: @assessment_question.id, assessment_id: @assessment.id)
        expect(bad_assessment_option).not_to be_valid
        expect(bad_assessment_option.errors.include?(:letter)).to eq(true)
      end
    end

    describe "#assessment_option" do
      it "should not be valid without a answer" do
        bad_assessment_option = AssessmentOption.create(letter: 'a', assessment_question_id: @assessment_question.id, assessment_id: @assessment.id)
        expect(bad_assessment_option).not_to be_valid
        expect(bad_assessment_option.errors.include?(:answer)).to eq(true)
      end
    end

  end

  context "associations" do
    describe "assessments_option should belongs_to assesment_question" do
      it "should belongs_to assessment question" do
        expect(@assessment_option.assessment_question).to eq(@assessment_question)
      end
    end

    describe "assessments_option should belongs_to assesment" do
      it "should belongs_to assessment question" do
        expect(@assessment_option.assessment).to eq(@assessment)
      end
    end
  end

end