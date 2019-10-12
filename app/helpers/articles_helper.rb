module ArticlesHelper

  #转换显示文章的类型
  def show_article_kind(status)
    case status
    when "draft"
      "草稿"
    when "private"
      "私密"
    when "public"
      "公开"
    end
  end

  #转换显示按钮的名称
  #def translate_button(button_name)
  #  case button_name
  #  when :bulk_delete
  #    "批量删除"
  #  when :bulk_update
  #    "批量更新"
  #  end
  #end

end
