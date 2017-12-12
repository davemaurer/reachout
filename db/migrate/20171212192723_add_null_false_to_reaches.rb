class AddNullFalseToReaches < ActiveRecord::Migration[5.1]
  def change
    change_column_null :reaches, :user_id, false
    change_column_null :reaches, :content_type, false
    change_column_null :reaches, :content_id, false
  end
end
