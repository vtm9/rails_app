class Web::Articles::CategoriesController < Web::Articles::ApplicationController
  before_action :set_article_category, only: %i[show edit update destroy]

  def index
    @article_categories = Article::Category.all
  end

  def show; end

  def new
    @article_category = Article::Category.new
  end

  def edit; end

  def create
    @article_category = Article::Category.new(article_category_params)
    if @article_category.save
      redirect_to @article_category, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def update
    if @article_category.update(article_category_params)
      redirect_to @article_category, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @article_category.destroy
    redirect_to articles_categories_url, notice: 'Category was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article_category
    @article_category = Article::Category.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def article_category_params
    params.require(:article_category).permit(:name, :slug)
  end
end
