class AddDefaultToColumns < ActiveRecord::Migration
  def change
    change_column :user_profiles, :about, :text, default: ""
    change_column :user_profiles, :first_name, :string, default: ""
    change_column :user_profiles, :last_name, :string, default: ""
    change_column :user_profiles, :occupation, :string, default: ""
  end
end
