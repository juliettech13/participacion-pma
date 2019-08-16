class CreateChapterMetadata < ActiveRecord::Migration[5.2]
  def change
    create_table :chapter_metadata do |t|
      t.string :content
      t.references :chapter, foreign_key: true

      t.timestamps
    end
  end
end
