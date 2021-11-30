class CreatePostHasTags < ActiveRecord::Migration[6.1]
  def change
    create_table :post_has_tags do |t|
      t.references :post, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
