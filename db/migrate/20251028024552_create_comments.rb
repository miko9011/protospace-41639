class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :content, null: false              # コメント本文
      t.references :user, null: false, foreign_key: true       # コメント投稿者
      t.references :prototype, null: false, foreign_key: true  # 対象プロトタイプ

      t.timestamps
    end
  end
end
