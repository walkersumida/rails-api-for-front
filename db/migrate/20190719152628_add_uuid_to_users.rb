class AddUuidToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :uuid, :string, after: :id
    add_index :users, :uuid, unique: true
  end
end
