class User < ApplicationRecord
  # Deviseのモジュール
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Prototypeモデルとの関連付け
  has_many :prototypes, dependent: :destroy
end