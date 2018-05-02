class RemoveIconFromLanguage < ActiveRecord::Migration
  def change
    remove_column :languages, :icon, :string
  end
end
