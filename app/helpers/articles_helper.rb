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

end
