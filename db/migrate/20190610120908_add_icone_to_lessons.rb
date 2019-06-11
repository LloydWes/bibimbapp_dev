class AddIconeToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :icone, :string
  end
end
