class Web::Articles::ApplicationController < Web::ApplicationController
  def resource_article
    @resource_article ||= (requested_article || Article.new)
  end

  def requested_article
    Article.find(params[:article_id])
  end
end
