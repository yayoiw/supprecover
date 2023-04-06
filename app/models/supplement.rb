class Supplement < ApplicationRecord
  has_many :supplement_tags, dependent: :destroy
  has_many :tags, through: :supplement_tags
end
