class Web::Moderation::ArticlesController < Web::Moderation::ApplicationController
  def index
    default_ransack_params = { state_eq: 'moderation' }
    @q = Article.ransack(params[:q] || default_ransack_params)

    @articles = @q.result(distinct: true)
  end

  def edit
    @article = ModerationArticleForm.find(params[:id])
  end

  def update
    @article = ModerationArticleForm.find(params[:id])
    if @article.update(article_params)
      redirect_to moderation_articles_path
    else
      render 'edit'
    end
  end

  private

  def article_params
    params.require(:article)
  end
end
