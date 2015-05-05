class ArticlesController < ApplicationController
	def index
		@articles = Article.all.page(params[:page]).per(5)
	end

	def show
		@article = Article.find(params[:id])	
	end

	def new
	end

	def create
		@article = Article.new(article_params)
		if @article.save
			flash[:message] = 'Created new article successfully'
      redirect_to articles_url
    else
      render 'new'
    end
	end

	private
  def article_params
    params.require(:article).permit(:title, :description, :photo)
  end

end
