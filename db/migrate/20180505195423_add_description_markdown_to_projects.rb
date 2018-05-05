class AddDescriptionMarkdownToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :description_markdown, :boolean, default: false
  end
end
