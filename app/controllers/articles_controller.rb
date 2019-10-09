class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "成功创建文章"
      redirect_to articles_path
    else
      render "new"
    end
  end

  private

  def article_params
    params.require(:article).permit(:title,:description)
  end
end
