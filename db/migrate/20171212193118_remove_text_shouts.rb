class RemoveTextShouts < ActiveRecord::Migration[5.1]
  def change
    drop_table :text_shouts
  end
end
