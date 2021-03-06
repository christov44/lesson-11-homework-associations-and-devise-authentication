class ArticlesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit, :destroy]


  def index
    @articles = Article.all
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to articles_path(@articles), notice: "The article was successfully created, nice work!"
    else
      flash.now[:error] = "An error occured, you f'd up"
      render :new
    end
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to article_path(@article), notice: "Strong work, the article was updated!"
    else
      flash.now[:error] = "An error occured, nothing was updated"
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])

    @article.destroy
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :author_id)
  end

end
