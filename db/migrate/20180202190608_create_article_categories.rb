class CreateArticleCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :article_categories do |t|
      t.string :name, null: false
      t.string :slug, null: false

      t.timestamps
    end
  end
end
