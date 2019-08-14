class AddNewToChapters < ActiveRecord::Migration[5.2]
  def change
    add_column :chapters, :new, :boolean, default: false
  end
end
