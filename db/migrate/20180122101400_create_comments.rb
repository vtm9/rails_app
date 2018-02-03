class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :article_comments do |t|
      t.string :commentor, null: false
      t.text :body, null: false
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
