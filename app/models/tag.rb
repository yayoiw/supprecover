class Tag < ApplicationRecord
  has_many :supplement_tags, dependent: :destroy
  has_many :supplements, through: :supplement_tags
end
