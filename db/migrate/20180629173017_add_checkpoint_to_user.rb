class AddCheckpointToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :checkpoint, :string, default: ""
  end
end
