class ChangeUserIdTypeInComments < ActiveRecord::Migration[7.2]
  def change
    change_column :comments, :user_id, :bigint
  end
end
