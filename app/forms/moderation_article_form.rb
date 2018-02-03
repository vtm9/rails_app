class ModerationArticleForm < Article
  include BaseForm

  permit(:state_event, :category)

  validates :category, presence: true
end
