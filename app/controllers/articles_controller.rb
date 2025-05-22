class ArticlesController < ApplicationController
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
  @article = Article.find(params[:id]) # this will find the article by id and assign it to the @article instance variable
  # so that we can use it in the edit view
end
def create
  @article = Article.new(params.require(:article).permit(:title, :description))

  if @article.save
    flash[:notice] = "Article was successfully created." # this will show a flash message to the user
    redirect_to article_path(@article) # first take the id of that instance then redirect to the show page of the article 
  else  
     render :new, status: :unprocessable_entity # if the article is not saved then go back to the new page
  end   
end


def update
  @article = Article.find(params[:id]) # this will find the article by id and assign it to the @article instance variable
  if @article.update(params.require(:article).permit(:title, :description)) 
    flash[:notice] = "Article was successfully updated."
    redirect_to article_path(@article)
  else
    render :edit, status: :unprocessable_entity
  end
end

end