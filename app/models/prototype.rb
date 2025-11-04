class Prototype < ApplicationRecord
  belongs_to :user              # Userモデルとのアソシエーション
  has_one_attached :image       # Active Storageで画像添付
  has_many :comments, dependent: :destroy  # ← コメントとのアソシエーション追加

  # バリデーション
  validates :title, presence: true        # プロトタイプ名称
  validates :catch_copy, presence: true   # キャッチコピー
  validates :concept, presence: true      # コンセプト
  validates :image, presence: true        # 画像添付必須
end