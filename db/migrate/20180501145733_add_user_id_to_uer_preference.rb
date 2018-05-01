class AddUserIdToUerPreference < ActiveRecord::Migration
  def change
    add_column :user_preferences, :user_id, :integer
  end
end
