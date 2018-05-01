class CreateUserPreferences < ActiveRecord::Migration
  def change
    create_table :user_preferences do |t|
      t.boolean :use_real_name, default: false
      t.boolean :profile_private, default: false

      t.timestamps null: false
    end
  end
end
