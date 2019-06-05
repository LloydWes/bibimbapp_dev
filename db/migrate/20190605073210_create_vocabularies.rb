class CreateVocabularies < ActiveRecord::Migration[5.2]
  def change
    create_table :vocabularies do |t|

      t.string :word #French word
      t.string :traduction #English word

      t.references :lesson, index: true

      t.timestamps
    end
  end
end
