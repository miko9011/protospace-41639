class Comment < ApplicationRecord
  belongs_to :user       # コメント投稿者とのアソシエーション
  belongs_to :prototype  # 対象プロトタイプとのアソシエーション

  validates :content, presence: true  # コメント本文のバリデーション
end
