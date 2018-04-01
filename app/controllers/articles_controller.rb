class ArticlesController < ApplicationController
	before_action :authenticate_user!, except:[:index, :show]
	before_action :set_article, except:[:index, :new, :create]
	#GET /articles
	def index
		@articles = Article.all
	end

	#GET /articles/:id
	def show
		@article.update_visits_count
		@comment = Comment.new
	end

	#GET /articles/new
	def new
		@article = Article.new
	end

	#GET /articles/:id/edit
	def edit
	end

	#POST /articles
	def create
		#@article = Article.new(title: params[:article][:title], body: params[:article][:body])
		@article = current_user.articles.new(article_params)
		if @article.save
			redirect_to @article
		else
			render :new
		end
	end

	#PUT /articles/:id
	def update
		if @article.update(article_params)
			redirect_to @article
		else
			render :edit
		end
	end

	#DELETE /articles/:id
	def destroy
		@article.destroy
		redirect_to articles_path
	end

	private
	def article_params
		params.require(:article).permit(:title, :body)
	end
	def set_article
		@article = Article.find(params[:id])
	end
end