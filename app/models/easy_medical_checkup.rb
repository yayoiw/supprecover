class EasyMedicalCheckup < ApplicationRecord
  validates :height, numericality: { greater_than_or_equal_to: 140, less_than_or_equal_to: 200 }
  validates :weight, numericality: { greater_than_or_equal_to: 40, less_than_or_equal_to: 150 }
  validates :blood_pressure_up, numericality: { only_integer: true }
  validates :blood_pressure_down, numericality: { only_integer: true }
  validates :total_cholesterol, numericality: { only_integer: true }
  validates :hdl_cholesterol, numericality: { only_integer: true }
  validates :ldl_cheolesterol, numericality: { only_integer: true }
  validates :neutral_fat, numericality: { only_integer: true }
  validates :ast, numericality: { only_integer: true }
  validates :alt, numericality: { only_integer: true }
  validates :gamma_gtp, numericality: { only_integer: true }
  belongs_to :user
end
