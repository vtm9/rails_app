class Web::ArticlesController < Web::ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = resource_article
  end

  def new
    @article = Article.new
  end

  def edit
    @article = resource_article
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = resource_article
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def moderate
    article = resource_article
    article.moderate!

    redirect_to article
  end

  def publish
    article = resource_article
    article.publish!

    redirect_to article
  end

  def destroy
    article = resource_article
    article.destroy

    redirect_to articles_path
  end

  private

  def resource_article
    Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text, :category_id)
  end
end
