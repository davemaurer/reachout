class CreateTextReaches < ActiveRecord::Migration[5.1]
  def change
    create_table :text_reaches do |t|
      t.string :body, null: false

      t.timestamps
    end
  end
end
