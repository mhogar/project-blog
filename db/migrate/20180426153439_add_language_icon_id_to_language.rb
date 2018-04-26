class AddLanguageIconIdToLanguage < ActiveRecord::Migration
  def change
    add_column :languages, :language_icon_id, :integer
  end
end
