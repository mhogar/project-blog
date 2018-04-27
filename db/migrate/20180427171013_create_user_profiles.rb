class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.text :about
      t.string :first_name
      t.string :last_name
      t.string :occupation
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
