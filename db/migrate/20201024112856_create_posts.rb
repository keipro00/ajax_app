class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :content

      # 既読機能実装時に「既読か未読か」を管理
      t.boolean :checked

      t.timestamps
    end
  end
end
