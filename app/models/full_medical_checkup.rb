class FullMedicalCheckup < ApplicationRecord
  validates :fasting_blood_sugar, numericality: { only_integer: true, allow_blank: true }, presence: true
  validates :hba1c, presence: true, precision: true
  enum urine_sugar: {usnegative: 0, usslight: 1, uspositive: 2, usdouble_positive: 3, ustriple_positive: 4}
  validates :urine_sugar, presence: true
  validates :uric_acid, presence: true, precision: true
  validates :creatinine, presence: true, precision: true
  validates :egfr, presence: true, precision: true
  validates :hematocrit, numericality: { only_integer: true, allow_blank: true }, presence: true
  validates :hemoglobin, numericality: { only_integer: true, allow_blank: true }, presence: true
  validates :rbc, numericality: { only_integer: true, allow_blank: true }, presence: true
  validates :wbc, numericality: { only_integer: true, allow_blank: true }, presence: true
  enum urine_protein: {upnegative: 0, upslight: 1, uppositive: 2, updouble_positive: 3, uptriple_positive: 4}
  validates :urine_protein, presence: true
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings
  before_validation :convert_enum_attributes_to_integer

  def recommended_supplements
  bad_ranking = {}

  columns = [:fasting_blood_sugar, :hba1c, :urine_sugar, :uric_acid, :creatinine, :egfr, :hematocrit, :hemoglobin, :rbc, :wbc, :urine_protein]

  columns.each do |column|
    value = self.send(column).to_f
    ref_values = Rails.configuration.x.reference_values[column]

    if value > ref_values[:max]
      bad_ranking[column] = (value.to_f / ref_values[:max]) * 100
    elsif value < ref_values[:min]
      bad_ranking[column] = (value.to_f / ref_values[:min]) * 100
    end
  end

    # if self.fasting_blood_sugar > Rails.configuration.x.reference_values[:fasting_blood_sugar][:max]
    #   bad_ranking[:fasting_blood_sugar] = (self.fasting_blood_sugar.to_f / Rails.configuration.x.reference_values[:fasting_blood_sugar][:max]) * 100
    # elsif self.fasting_blood_sugar < Rails.configuration.x.reference_values[:fasting_blood_sugar][:min]
    #   bad_ranking[:fasting_blood_sugar] = (self.fasting_blood_sugar.to_f / Rails.configuration.x.reference_values[:fasting_blood_sugar][:min]) * 100
    # end

    # if self.hba1c > Rails.configuration.x.reference_values[:hba1c][:max]
    #   bad_ranking[:hba1c] = (self.hba1c.to_f/ Rails.configuration.x.reference_values[:hba1c][:max]) * 100
    # elsif self.hba1c < Rails.configuration.x.reference_values[:hba1c][:min]
    #   bad_ranking[:hba1c] = (self.hba1c.to_f / Rails.configuration.x.reference_values[:hba1c][:min]) * 100
    # end

    # if self.urine_sugar.to_f > Rails.configuration.x.reference_values[:urine_sugar][:max]
    #   bad_ranking[:urine_sugar] = (self.urine_sugar.to_f / Rails.configuration.x.reference_values[:urine_sugar][:max]) * 100
    # elsif self.urine_sugar.to_f < Rails.configuration.x.reference_values[:urine_sugar][:min]
    #   bad_ranking[:urine_sugar] = (self.urine_sugar.to_f / Rails.configuration.x.reference_values[:urine_sugar][:min]) * 100
    # end

    # if self.uric_acid > Rails.configuration.x.reference_values[:uric_acid][:max]
    #   bad_ranking[:uric_acid] = (self.uric_acid.to_f / Rails.configuration.x.reference_values[:uric_acid][:max]) * 100
    # elsif self.uric_acid < Rails.configuration.x.reference_values[:uric_acid][:min]
    #   bad_ranking[:uric_acid] = (self.uric_acid.to_f / Rails.configuration.x.reference_values[:uric_acid][:min]) * 100
    # end

    # if self.creatinine > Rails.configuration.x.reference_values[:creatinine][:max]
    #   bad_ranking[:creatinine] = (self.creatinine.to_f / Rails.configuration.x.reference_values[:creatinine][:max]) * 100
    # elsif self.creatinine < Rails.configuration.x.reference_values[:creatinine][:min]
    #   bad_ranking[:creatinine] = (self.creatinine.to_f / Rails.configuration.x.reference_values[:creatinine][:min]) * 100
    # end

    # if self.egfr > Rails.configuration.x.reference_values[:egfr][:max]
    #   bad_ranking[:egfr] = (self.egfr.to_f / Rails.configuration.x.reference_values[:egfr][:max]) * 100
    # elsif self.egfr < Rails.configuration.x.reference_values[:egfr][:min]
    #   bad_ranking[:egfr] = (self.egfr.to_f / Rails.configuration.x.reference_values[:egfr][:min]) * 100
    # end

    # if self.hematocrit > Rails.configuration.x.reference_values[:hematocrit][:max]
    #   bad_ranking[:hematocrit] = (self.hematocrit.to_f / Rails.configuration.x.reference_values[:hematocrit][:max]) * 100
    # elsif self.hematocrit < Rails.configuration.x.reference_values[:hematocrit][:min]
    #   bad_ranking[:hematocrit] = (self.hematocrit.to_f / Rails.configuration.x.reference_values[:hematocrit][:min]) * 100
    # end

    # if self.hemoglobin > Rails.configuration.x.reference_values[:hemoglobin][:max]
    #   bad_ranking[:hemoglobin] = (self.hemoglobin.to_f / Rails.configuration.x.reference_values[:hemoglobin][:max]) * 100
    # elsif self.hemoglobin < Rails.configuration.x.reference_values[:hemoglobin][:min]
    #   bad_ranking[:hemoglobin] = (self.hemoglobin.to_f / Rails.configuration.x.reference_values[:hemoglobin][:min]) * 100
    # end

    # if self.rbc > Rails.configuration.x.reference_values[:rbc][:max]
    #   bad_ranking[:rbc] = (self.rbc.to_f / Rails.configuration.x.reference_values[:rbc][:max]) * 100
    # elsif self.rbc < Rails.configuration.x.reference_values[:rbc][:min]
    #   bad_ranking[:rbc] = (self.rbc.to_f / Rails.configuration.x.reference_values[:rbc][:min]) * 100
    # end

    # if self.wbc > Rails.configuration.x.reference_values[:wbc][:max]
    #   bad_ranking[:wbc] = (self.wbc.to_f / Rails.configuration.x.reference_values[:wbc][:max]) * 100
    # elsif self.wbc < Rails.configuration.x.reference_values[:wbc][:min]
    #   bad_ranking[:wbc] = (self.wbc.to_f / Rails.configuration.x.reference_values[:wbc][:min]) * 100
    # end

    # if self.urine_protein.to_f > Rails.configuration.x.reference_values[:urine_protein][:max]
    #   bad_ranking[:urine_protein] = (self.urine_protein.to_f / Rails.configuration.x.reference_values[:urine_protein][:max]) * 100
    # elsif self.urine_protein.to_f < Rails.configuration.x.reference_values[:urine_protein][:min]
    #   bad_ranking[:urine_protein] = (self.urine_protein.to_f / Rails.configuration.x.reference_values[:urine_protein][:min]) * 100
    # end


  sorted_bad_rankings = bad_ranking.sort_by { |_key, value| -(value - 100).abs }.to_h

  recommendations = []

  conditions = sorted_bad_rankings.map do |key, value|
    up_or_down = value > 100 ? 'uptodown' : 'downtoup'
    [key, up_or_down]
  end

  tags_with_supplements = Tag.includes(:supplements).where(name: conditions.map(&:first), up_or_down: conditions.map(&:second))

  recommendations = tags_with_supplements.flat_map(&:supplements)

  recommendations.flatten!
  recommendations.uniq!
  Supplement.where(id: recommendations.map(&:id))
  end

  def total_supplements(easy_supplements, full_supplements)
    recommendations = []
    recommendations = easy_supplements + full_supplements
    recommendations.flatten!
    recommendations.uniq!
    Supplement.where(id: recommendations.map(&:id))
  end

  private

  def convert_enum_attributes_to_integer
    self.urine_sugar = urine_sugar.to_i if urine_sugar.is_a?(String)
    self.urine_protein = urine_protein.to_i if urine_protein.is_a?(String)
  end
end
