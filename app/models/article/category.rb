class Article::Category < ApplicationRecord
  def self.model_name
    ActiveModel::Name.new(self, nil, 'Articles::Category')
  end

  has_many :articles
end
