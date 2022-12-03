class ArticlesController < ApplicationController
  def index
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = {
        type: "success",
        message: "Article was successfully created"
      }
      redirect_to articles_path
    else
      render 'new'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
