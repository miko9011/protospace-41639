class User < ApplicationRecord
  # Deviseのモジュール
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Prototypeモデルとの関連付け
  has_many :prototypes, dependent: :destroy

  # === 必須項目のバリデーション ===
  validates :name, presence: true
  validates :profile, presence: true
  validates :occupation, presence: true  # ← company → occupation に修正
  validates :position, presence: true
end