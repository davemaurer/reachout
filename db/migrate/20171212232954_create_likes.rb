class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.references :reach, foreign_key: true

      t.timestamps
    end

    add_index :likes, [:user_id, :reach_id], unique: true
  end
end
