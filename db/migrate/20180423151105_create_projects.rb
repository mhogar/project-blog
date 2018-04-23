class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :repo_link
      t.text :description

      t.timestamps null: false
    end
  end
end
