class MakeReachesPolymorphic < ActiveRecord::Migration[5.1]
  class Reach < ApplicationRecord
    belongs_to :content, polymorphic: true
  end

  class TextReach < ApplicationRecord; end

  def change
    change_table(:reaches) do |t|
      t.string :content_type
      t.integer :content_id
      t.index [:content_type, :content_id]
    end

    reversible do |dir|
      Reach.reset_column_information
      Reach.find_each do |reach|
        dir.up do
          text_reach = TextReach.create(body: reach.body)
          reach.update(content_id: text_reach.id, content_type: "TextReach")
        end
        dir.down do
          reach.update(body: reach.content.body)
          reach.content.destroy
        end
      end
    end

    remove_column :reaches, :body, :string
  end
end
