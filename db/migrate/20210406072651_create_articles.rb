class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|

      t.timestamps
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :content, null: false
      
    end
  end
end
