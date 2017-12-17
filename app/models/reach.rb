class Reach < ApplicationRecord
  belongs_to :user
  belongs_to :content, polymorphic: true

  validates :user, presence: true

  delegate :username, to: :user

  searchable do
    text :content do
      case content
        when TextReach then content.body
        when TextPhoto then content.image_file_name
      end
    end
  end
end
