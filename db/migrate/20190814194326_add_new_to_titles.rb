class AddNewToTitles < ActiveRecord::Migration[5.2]
  def change
    add_column :titles, :new, :boolean, default: false
  end
end
