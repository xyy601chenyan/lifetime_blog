class AddTokenToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :token, :string
    add_index :articles, :token, unique: true
  end
end
