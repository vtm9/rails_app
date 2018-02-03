require 'test_helper'

class Web::ArticlesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get articles_url
    assert_response :success
  end

  test 'should get new' do
    get new_article_url, headers: auth_headers
    assert_response :success
  end

  test 'should create article' do
    @category = article_categories(:it)
    post articles_path, params: { article: { category_id: @category.id, text: '1234', title: '12345' } }, headers: auth_headers
    article = Article.find_by(title: '12345')
    assert { article.text == '1234' }
  end

  test 'should show article' do
    @article = articles(:draft)
    get article_url(@article)
    assert_response :success
  end

  test 'should get edit' do
    @article = articles(:draft)
    get edit_article_url(@article), headers: auth_headers
    assert_response :success
  end

  test 'should update article' do
    @article = articles(:draft)
    patch article_url(@article), params: { article: { title: 'newTitle' } }, headers: auth_headers
    assert { @article.reload.title == 'newTitle' }
  end

  test 'should destroy article' do
    @article = articles(:draft)
    delete article_url(@article), headers: auth_headers
    assert { !Article.exists? id: @article }
  end

  test 'should transition article to moderation state' do
    @article = articles(:draft)
    patch moderate_article_url(@article), headers: auth_headers
    assert { @article.reload.moderation? }
  end

  test 'should transition article to published state' do
    @article = articles(:moderation)
    patch publish_article_url(@article), headers: auth_headers
    assert { @article.reload.published? }
  end
end
