class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :easy_medical_checkup
  belongs_to :full_medical_checkup
end
