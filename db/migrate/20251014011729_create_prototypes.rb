class CreatePrototypes < ActiveRecord::Migration[7.1]
  def change
    create_table :prototypes do |t|
      t.string :title        # プロトタイプの名称
      t.text :catch_copy     # キャッチコピー
      t.text :concept        # コンセプト
      t.references :user, null: false, foreign_key: true  # 外部キーを追加！

      t.timestamps
    end
  end
end
