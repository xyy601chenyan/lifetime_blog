class AddStatusToArticle < ActiveRecord::Migration[5.2]
  def change
    #为文章添加类型，默认为草稿
    add_column :articles, :status, :string, default: "draft"
  end
end
