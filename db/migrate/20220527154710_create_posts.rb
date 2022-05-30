class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :topic
      t.boolean :enabled, default: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
