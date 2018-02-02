require 'test_helper'

class Web::Articles::CommentsControllerTest < ActionDispatch::IntegrationTest

  test 'should create article_comment' do
    @article_comment = article_comments(:empty)
    @article = articles(:one)
    assert_difference('Article::Comment.count') do
      post article_comments_url(@article),  params: {article_comment: {body: @article_comment.body, commentor: @article_comment.commentor } }
    end

    assert_redirected_to article_url(@article)
  end

  test 'should destroy article_comment' do
    @article = articles(:one)
    @article_comment = article_comments(:one)

    assert_difference('Article::Comment.count', -1) do
      delete article_comment_url(article_id: @article.id, id: @article_comment.id)
    end

    assert_redirected_to article_url(@article)
  end
end
