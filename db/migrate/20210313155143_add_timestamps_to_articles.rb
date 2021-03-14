class AddTimestampsToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :created_by, :string
    add_column :articles, :updated_by, :string
  end
end
