class RemoveIconFromLanguage < ActiveRecord::Migration
  def change
    remove_column :languages, :icon, :string
    add_reference :languages, :languages_icon, index: true
    add_foreign_key :languages, :languages_icons
  end
end
