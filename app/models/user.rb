class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  has_one :easy_medical_checkups, dependent: :destroy
end
