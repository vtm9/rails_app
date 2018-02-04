require 'test_helper'

class Web::Articles::CommentsControllerTest < ActionDispatch::IntegrationTest
  test 'should create comment' do
    article = articles(:published)
    params = { commentor: 'test', body: 'new_comment' }
    post article_comments_url(article.id), params: { article_comment: params }, headers: auth_headers

    comment = article.comments.find_by(params)
    assert {comment.persisted?}
  end

  test 'should destroy comment' do
    comment = article_comments(:one)
    delete article_comment_url(comment.article.id, comment.id), headers: auth_headers

    assert { !Article::Comment.exists? id: comment }
  end
end
