class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|

      t.timestamps
      t.integer :article_id, null: false
      t.string :image_id, null: true
    end
  end
end
