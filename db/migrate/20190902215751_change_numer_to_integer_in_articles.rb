class ChangeNumerToIntegerInArticles < ActiveRecord::Migration[5.2]
  def change
    change_column :articles, :number, :float
  end
end
