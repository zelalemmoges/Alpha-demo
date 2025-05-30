class ArticlesController < ApplicationController
before_action :set_article, only: %i[ show edit update destroy ] # this will run the set_article method before the show, edit, update and destroy actions


def home
  @articles = Article.all # this will get all the articles from the database
end
def show
  @article = Article.find(params[:id])
end
def index
    @articles = Article.all
  end

def new
  @article = Article.new # this will create a new instance of the article model b/c when error occure we need to show the form again so we need to create a new instance of the article model
end

def edit
  @article = Article.find(params[:id]) # this will find the article by idfrom the routes and assign it to the @article instance variable
  # so that we can use it in the edit view
end
def create
  @article = Article.new(article_params)
  @article.user = User.first # this will assign the first user to the article, you can change this to assign the current user if you have authentication set up
  if @article.save
    flash[:notice] = "Article was successfully created." # this will show a flash message to the user
    redirect_to article_path(@article) # first take the id of that instance then redirect to the show page of the article 
  else  
     render :new, status: :unprocessable_entity # if the article is not saved then go back to the new page
  end   
end


def update
  @article = Article.find(params[:id]) # this will find the article by id and assign it to the @article instance variable
  if @article.update(article_params) 
    flash[:notice] = "Article was successfully updated."
    redirect_to article_path(@article)
  else
    render :edit, status: :unprocessable_entity
  end
end

def destroy
  @article = Article.find(params[:id]) # this will find the article by id and assign it to the @article instance variable
  @article.destroy # this will destroy the article
  flash[:notice] = "Article was successfully destroyed."
  redirect_to articles_path # this will redirect to the index page of the articles
end

private

def set_article
  @article = Article.find(params[:id]) # this will find the article by id and assign it to the @article instance variable
end

def article_params
  params.require(:article).permit(:title, :description) # this will require the article params and permit the title and description
end
end
