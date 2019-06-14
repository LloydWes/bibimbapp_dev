require 'rails_helper'

RSpec.describe Assessment, type: :model do

  before(:each) do 
    @assessment = Assessment.create(lesson_id: Lesson.all.sample.id, attempt_limit: 10)
  end


  context "validation" do

    it "is valid with valid attributes" do
      expect(@assessment).to be_a(Assessment)
      expect(@assessment).to be_valid
    end

    describe "#lesson_id" do
      it "should not be valid without a lesson_id" do
        bad_assessment = Assessment.create(attempt_limit: 10)
        expect(bad_assessment).not_to be_valid
        expect(bad_assessment.errors.include?(:lesson_id)).to eq(true)
      end
    end

    describe "#attempt_limit" do
      it "should not be valid without last_name" do
        bad_assessment = Assessment.create(lesson_id: 1)
        expect(bad_assessment).not_to be_valid
        expect(bad_assessment.errors.include?(:attempt_limit)).to eq(true)
      end
    end
  end

  context "associations" do
    describe "assessments should have many assesment questions" do
      it "should have_many assessment questions" do
        assessment_question = AssessmentQuestion.create(active: true, order: 10, question: 'Hop hop hop', correct_letter: 'a', correct_answer: "Merci d'avoir lu ce code jusqu'ici", assessment_id: @assessment.id)
        expect(@assessment.assessment_questions.include?(assessment_question)).to eq(true)
      end
    end
  end

end