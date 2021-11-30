class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :content
      t.integer :views

      t.timestamps
    end
  end
end
