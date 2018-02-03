class Article < ApplicationRecord
  belongs_to :category, required: false
  has_many :comments, dependent: :destroy
  has_many :links, inverse_of: :article, dependent: :destroy

  accepts_nested_attributes_for :links, reject_if: :all_blank, allow_destroy: true

  validates :title, presence: true, length: { minimum: 5 }


  state_machine :state, initial: :draft do
    state :draft
    state :moderation
    state :published

    event :moderate do
      transition draft: :moderation
    end

    event :publish do
      transition moderation: :published
    end
  end
end
