class ArticlesController < ApplicationController
  before_action :authenticate_user!,only: [:new,:create,:edit,:update,:destroy]
  before_action :find_article,only: [:show,:edit,:update,:destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = current_user.articles.new
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      flash[:notice] = "成功创建文章"
      redirect_to articles_path
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "已更新文章"
      redirect_to article_path(@article.token)
    else
      render "edit"
    end
  end

  def destroy
    @article.destroy
    flash[:alert] = "已删除文章"
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title,:description)
  end

  def find_article
    @article = current_user.articles.find_by_token!(params[:id])
  end
end
