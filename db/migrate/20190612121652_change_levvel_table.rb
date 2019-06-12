class ChangeLevvelTable < ActiveRecord::Migration[5.2]
  def change
    add_column :levels, :level_description, :string
  end
end
