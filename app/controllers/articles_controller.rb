class ArticlesController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show]
  before_action :find_article,only: [:show,:edit,:update,:destroy,:reorder]

  #显示公开发布的文章
  def index
    @articles = Article.published
  end

  #显示所有文章，包括：公开、草稿和私密类型的文章
  def writer
    @articles = Article.rank(:row_order).all
  end

  def new
    @article = current_user.articles.new
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      flash[:notice] = "成功创建文章"
      redirect_to article_path(@article.token)
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

  #批量更新和批量删除
  def bulk_operate
    total = 0
    Array(params[:ids]).each do |article_id|
      article = Article.find_by_token!(article_id)

      if params[:commit].to_sym == :bulk_update
        article.status = params[:status]
        if article.save
          total += 1
        end
        flash[:notice] = "已更新#{total}篇文章"
      elsif params[:commit].to_sym == :bulk_delete
        article.destroy
        total += 1
        flash[:alert] = "已删除#{total}篇文章"
      end
    end

    redirect_to writer_articles_path
  end

  def reorder
    @article.row_order_position = params[:position]
    @article.save

    respond_to do |format|
      format.html {redirect_to writer_articles_path}
      format.json {render json: {message: "ok"}}
    end

  end

  private

  def article_params
    params.require(:article).permit(:title,:description,:status)
  end

  def find_article
    @article = current_user.articles.find_by_token!(params[:id])
  end
end
