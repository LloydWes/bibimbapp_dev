class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|

      t.integer :order
      t.string :title
      t.text :script
      t.text :grammar
      t.string :media

      t.references :level, index: true
      

      t.timestamps
    end
  end
end
