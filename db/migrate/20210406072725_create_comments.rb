class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|

      t.timestamps
      t.integer :user_id, null: false
      t.integer :article_id, null: false
      t.string :body, null: false
    end
  end
end
