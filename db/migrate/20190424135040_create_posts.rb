class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.bigint :user_id
      t.string :title
      t.text :body
      t.integer :status

      t.timestamps
    end
    add_index :posts, :user_id
  end
end
