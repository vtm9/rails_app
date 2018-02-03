require 'test_helper'

class Web::Articles::CommentsControllerTest < ActionDispatch::IntegrationTest
  test 'should create comment' do
    article = articles(:published)
    params = { commentor: 'me', body: 'some text' }
    post article_comments_url(article.id), params: { article_comment: params }, headers: auth_headers
    assert_response :redirect
  end

  test 'should destroy comment' do
    comment = article_comments(:one)
    params = { commentor: 'me', body: 'some text' }
    post article_comments_url(comment.article.id), params: { article_comment: params }, headers: auth_headers
    assert_response :redirect
  end
end
