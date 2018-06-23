class AddMessengerIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :messenger_id, :string
  end
end
