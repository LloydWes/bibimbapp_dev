class CreateQuizsTables < ActiveRecord::Migration[5.2]
  def change
    create_table :assessments do |t|
      t.integer :lesson_id
      t.integer :attempt_limit
      t.index [:lesson_id]
      t.timestamps
    end

    create_table :assessment_questions, force: :cascade do |t|
     t.boolean :active
     t.integer :order
     t.string :question
     t.string :correct_letter
     t.string :correct_answer
     t.integer :assessment_id
     t.integer :level_id
     t.index [:assessment_id]
     t.index [:level_id]
     t.timestamps
   end


   create_table :assessment_options, force: :cascade do |t|
     t.string :letter
     t.string :answer
     t.integer :assessment_question_id
     t.integer :assessment_id
     t.index [:assessment_question_id], name: :index_assessment_options_on_assessment_question_id
     t.index [:assessment_id]
     t.timestamps
   end

   create_table :assessment_answers, force: :cascade do |t|
     t.string :letter
     t.string :answer
     t.integer :attempt_number
     t.boolean :correct
     t.integer :assessment_question_id
     t.integer :assessment_id
     t.datetime :created_at, null: false
     t.datetime :updated_at, null: false
     t.integer :user_id
     t.index [:user_id]
     t.index [:assessment_id], name: :index_assessment_answers_on_assessment_id
     t.index [:assessment_question_id], name: :index_assessment_answers_on_assessment_question_id
   end

 end
end
