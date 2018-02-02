class Article::Comment < ApplicationRecord
  def self.model_name
    ActiveModel::Name.new(self, nil, 'Articles::Category')
  end
  belongs_to :article
end
