class AddRowOrderToArticles < ActiveRecord::Migration[5.2]
  def change
    #添加gem 'ranked-model'默认的排序字段row_order
    add_column :articles, :row_order, :integer
    add_index :articles, :row_order
  end
end
