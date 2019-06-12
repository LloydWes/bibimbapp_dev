class AddMedia2AndDescriptionToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :media2, :string
    add_column :lessons, :description, :text
  end
end
