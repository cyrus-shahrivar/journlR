class ArticlesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @articles = @user.articles
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @article = @user.articles.new
  end

  def edit
    @user = User.find(params[:user_id])
    @article = @user.articles.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @article = @user.articles.new(article_params)

    if @article.save
      redirect_to user_articles_path(@user)
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:user_id])
    @article = @user.articles.find(params[:id])

    if @article.update(article_params)
      redirect_to user_articles_path
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to user_articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
