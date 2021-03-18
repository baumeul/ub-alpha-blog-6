class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end
  
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
    # render plain: params[:article]
  end
  
  def create
    # render plain: params[:article]
    @article = Article.new(params.require(:article).permit(:title, :description, :created_by, :updated_by))
    if @article.save
      flash[:notice] = "Article was created successfully"
      redirect_to @article
    else
      render 'new'
    end
  end

end