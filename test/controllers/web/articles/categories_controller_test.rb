require 'test_helper'

class Web::Article::CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = article_categories(:one)
  end

  test 'should get index' do
    get articles_categories_url
    assert_response :success
  end

  test 'should get new' do
    get new_articles_category_url
    assert_response :success
  end

  test 'should create category' do
    assert_difference('Article::Category.count') do
      post articles_categories_url, params: { article_category: { name: @category.name, slug: @category.slug } }
    end
    assert_redirected_to articles_category_url(Article::Category.last)
  end

  test 'should show category' do
    get articles_category_url(@category)
    assert_response :success
  end

  test 'should get edit' do
    get edit_articles_category_url(@category)
    assert_response :success
  end

  test 'should update category' do
    patch articles_category_url(@category), params: { article_category: { name: @category.name, slug: @category.slug } }
    assert_redirected_to articles_category_url(@category)
  end

  test 'should destroy category' do
    assert_difference('Article::Category.count', -1) do
      delete articles_category_url(@category)
    end
    assert_redirected_to articles_categories_url
  end
end
