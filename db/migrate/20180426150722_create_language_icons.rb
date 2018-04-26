class CreateLanguageIcons < ActiveRecord::Migration
  def change
    create_table :language_icons do |t|
      t.string :image

      t.timestamps null: false
    end
  end
end
