class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :name, uniqueness: true
  has_many :easy_medical_checkups, dependent: :destroy
end