class ModerationArticleForm < Article
  include BaseForm

  permit(:state_event, :category_id)

  validates :category, presence: true, if: :published?
end
