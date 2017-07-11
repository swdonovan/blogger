class ArticlesController < ApplicationController
  before_action :set_article, only: [:destroy, :edit, :show, :update]
  before_action :get_all_articles, only: [:index]
  def index
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save

    flash.notice = "Aritcle #{@article.title} ##{@article.id} has been created"

    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy

    flash.notice = "Article #{@article.title} has been deleted!"

    redirect_to articles_path
  end

  def edit
  end

  def update
    @article.update(article_params)

    flash.notice = "Aricle # #{@article.id}, titled: #{@article.title},
        has been updated!"

    redirect_to article_path(@article)
  end


  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def get_all_articles
    @articles = Article.all
  end
end
