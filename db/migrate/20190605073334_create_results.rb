class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|

      t.boolean :is_past?
      t.integer :score
      t.datetime :date_exam

      t.references :lesson, index: true
      t.references :user, index: true


      t.timestamps
    end
  end
end
