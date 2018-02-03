require 'test_helper'

class Web::Moderation::ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:draft)
  end

  test 'should get index' do
    get moderation_articles_url
    assert_response :success
  end

  test 'should get edit' do
    get edit_moderation_article_url(@article), headers: auth_headers
    assert_response :success
  end

  test 'should update' do
    article = articles(:moderation)
    category = article_categories(:it)

    put moderation_article_url(article),
        params: {
          article: {
            state_event: 'publish',
            category_id: category.id
          }
        }, headers: auth_headers

    assert { article.reload.category == category }
    assert { article.published? }
  end
end
