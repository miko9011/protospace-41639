class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :prototypes, dependent: :destroy

  validates :name, presence: true
  validates :profile, presence: true
  validates :occupation, presence: true  # ✅ 所属
  validates :position, presence: true    # ✅ 役職
end