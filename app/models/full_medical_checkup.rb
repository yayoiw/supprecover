class FullMedicalCheckup < ApplicationRecord
  validates :fasting_blood_sugar, presence: true
  validates :hba1c, presence: true
  validates :urine_sugar, presence: true
  validates :uric_acid, presence: true
  validates :creatinine, presence: true
  validates :egfr, presence: true
  validates :hematocrit, presence: true
  validates :hemogrobin, presence: true
  validates :rbc, presence: true
  validates :wbc, presence: true
  validates :urine_protein, presence: true
  belongs_to :user
end
