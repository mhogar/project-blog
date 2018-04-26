class RemoveLanguageIconIdFromLanguage < ActiveRecord::Migration
  def change
    remove_column :languages, :languages_icon_id, :integer
  end
end
