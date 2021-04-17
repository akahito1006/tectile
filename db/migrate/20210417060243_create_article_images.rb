class CreateArticleImages < ActiveRecord::Migration[5.2]
  def change
    create_table :article_images do |t|

      t.timestamps
      t.integer :article_id, null: false
      t.string :image_id, null: false
    end
  end
end
