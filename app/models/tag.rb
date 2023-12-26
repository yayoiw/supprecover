class Tag < ApplicationRecord
  has_many :taggings
  has_many :easy_medical_checkups, through: :taggings
  has_many :full_medical_checkups, through: :taggings
  has_many :supplement_tags, dependent: :destroy
  has_many :supplements, through: :supplement_tags
  enum up_or_down: { uptodown: 0, downtoup: 1 }
end
