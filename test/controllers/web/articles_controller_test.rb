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
    @category = article_categories(:one)
    post articles_path, params: { article: { category_id: @category.id, text: '1234', title: '12345' } }, headers: auth_headers
    article = Article.find_by(title: '12345')
    assert { article.text == '1234' }
  end

  test 'should show article' do
    @article = articles(:one)
    get article_url(@article)
    assert_response :success
  end

  test 'should get edit' do
    @article = articles(:one)
    get edit_article_url(@article), headers: auth_headers
    assert_response :success
  end

  test 'should update article' do
    @article = articles(:one)
    patch article_url(@article), params: { article: { title: 'newTitle' } }, headers: auth_headers
    assert { @article.reload.title == 'newTitle' }
  end

  test 'should destroy article' do
    @article = articles(:one)
    delete article_url(@article), headers: auth_headers
    assert { !Article.exists? id: @article }
  end
end
