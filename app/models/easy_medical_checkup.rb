class EasyMedicalCheckup < ApplicationRecord
  validates :height, numericality: { greater_than_or_equal_to: 140, less_than_or_equal_to: 200, allow_blank: true },
                     presence: true
  validates :weight, numericality: { greater_than_or_equal_to: 40, less_than_or_equal_to: 150, allow_blank: true },
                     presence: true
  validates :blood_pressure_up, numericality: { only_integer: true, allow_blank: true }, presence: true
  validates :blood_pressure_down, numericality: { only_integer: true, allow_blank: true }, presence: true
  validates :total_cholesterol, numericality: { only_integer: true, allow_blank: true }, presence: true
  validates :hdl_cholesterol, numericality: { only_integer: true, allow_blank: true }, presence: true
  validates :ldl_cholesterol, numericality: { only_integer: true, allow_blank: true }, presence: true
  validates :neutral_fat, numericality: { only_integer: true, allow_blank: true }, presence: true
  validates :ast, numericality: { only_integer: true, allow_blank: true }, presence: true
  validates :alt, numericality: { only_integer: true, allow_blank: true }, presence: true
  validates :gamma_gtp, numericality: { only_integer: true, allow_blank: true }, presence: true
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings

  def bmi
    (weight / ((height / 100.0)**2)).round(1) # BMI ＝ 体重kg ÷ (身長m)2
  end

  def body_type
    case bmi
    when 0...18.5
      'やせ型'
    when 18.5...25
      '標準'
    when 25...30
      '肥満(軽)'
    else
      '肥満(重)'
    end
  end

  def recommended_supplements
    bad_ranking = {}

    columns = %i[blood_pressure_up blood_pressure_down total_cholesterol hdl_cholesterol ldl_cholesterol
                 neutral_fat ast alt gamma_gtp]

    columns.each do |column|
      value = send(column).to_f
      ref_values = Rails.configuration.x.reference_values[column]

      if value > ref_values[:max]
        bad_ranking[column] = (value.to_f / ref_values[:max]) * 100
      elsif value < ref_values[:min]
        bad_ranking[column] = (value.to_f / ref_values[:min]) * 100
      end
    end
    # if self.blood_pressure_up > Rails.configuration.x.reference_values[:blood_pressure_up][:max]
    #   bad_ranking[:blood_pressure_up] = (self.blood_pressure_up.to_f / Rails.configuration.x.reference_values[:blood_pressure_up][:max]) * 100
    # elsif self.blood_pressure_up < Rails.configuration.x.reference_values[:blood_pressure_up][:min]
    #   bad_ranking[:blood_pressure_up] = (self.blood_pressure_up.to_f / Rails.configuration.x.reference_values[:blood_pressure_up][:min]) * 100
    # end

    # if self.blood_pressure_down > Rails.configuration.x.reference_values[:blood_pressure_down][:max]
    #   bad_ranking[:blood_pressure_down] = (self.blood_pressure_down.to_f/ Rails.configuration.x.reference_values[:blood_pressure_down][:max]) * 100
    # elsif self.blood_pressure_down < Rails.configuration.x.reference_values[:blood_pressure_down][:min]
    #   bad_ranking[:blood_pressure_down] = (self.blood_pressure_down.to_f / Rails.configuration.x.reference_values[:blood_pressure_down][:min]) * 100
    # end

    # if self.total_cholesterol > Rails.configuration.x.reference_values[:total_cholesterol][:max]
    #   bad_ranking[:total_cholesterol] = (self.total_cholesterol.to_f / Rails.configuration.x.reference_values[:total_cholesterol][:max]) * 100
    # elsif self.total_cholesterol < Rails.configuration.x.reference_values[:total_cholesterol][:min]
    #   bad_ranking[:total_cholesterol] = (self.total_cholesterol.to_f / Rails.configuration.x.reference_values[:total_cholesterol][:min]) * 100
    # end

    # if self.hdl_cholesterol > Rails.configuration.x.reference_values[:hdl_cholesterol][:max]
    #   bad_ranking[:hdl_cholesterol] = (self.hdl_cholesterol.to_f / Rails.configuration.x.reference_values[:hdl_cholesterol][:max]) * 100
    # elsif self.hdl_cholesterol < Rails.configuration.x.reference_values[:hdl_cholesterol][:min]
    #   bad_ranking[:hdl_cholesterol] = (self.hdl_cholesterol.to_f / Rails.configuration.x.reference_values[:hdl_cholesterol][:min]) * 100
    # end

    # if self.ldl_cholesterol > Rails.configuration.x.reference_values[:ldl_cholesterol][:max]
    #   bad_ranking[:ldl_cholesterol] = (self.ldl_cholesterol.to_f / Rails.configuration.x.reference_values[:ldl_cholesterol][:max]) * 100
    # elsif self.ldl_cholesterol < Rails.configuration.x.reference_values[:ldl_cholesterol][:min]
    #   bad_ranking[:ldl_cholesterol] = (self.ldl_cholesterol.to_f / Rails.configuration.x.reference_values[:ldl_cholesterol][:min]) * 100
    # end

    # if self.neutral_fat > Rails.configuration.x.reference_values[:neutral_fat][:max]
    #   bad_ranking[:neutral_fat] = (self.neutral_fat.to_f / Rails.configuration.x.reference_values[:neutral_fat][:max]) * 100
    # elsif self.neutral_fat < Rails.configuration.x.reference_values[:neutral_fat][:min]
    #   bad_ranking[:neutral_fat] = (self.neutral_fat.to_f / Rails.configuration.x.reference_values[:neutral_fat][:min]) * 100
    # end

    # if self.ast > Rails.configuration.x.reference_values[:ast][:max]
    #   bad_ranking[:ast] = (self.ast.to_f / Rails.configuration.x.reference_values[:ast][:max]) * 100
    # elsif self.ast < Rails.configuration.x.reference_values[:ast][:min]
    #   bad_ranking[:ast] = (self.ast.to_f / Rails.configuration.x.reference_values[:ast][:min]) * 100
    # end

    # if self.alt > Rails.configuration.x.reference_values[:alt][:max]
    #   bad_ranking[:alt] = (self.alt.to_f / Rails.configuration.x.reference_values[:alt][:max]) * 100
    # elsif self.alt < Rails.configuration.x.reference_values[:alt][:min]
    #   bad_ranking[:alt] = (self.alt.to_f / Rails.configuration.x.reference_values[:alt][:min]) * 100
    # end

    # if self.gamma_gtp > Rails.configuration.x.reference_values[:gamma_gtp][:max]
    #   bad_ranking[:gamma_gtp] = (self.gamma_gtp.to_f / Rails.configuration.x.reference_values[:gamma_gtp][:max]) * 100
    # elsif self.gamma_gtp < Rails.configuration.x.reference_values[:gamma_gtp][:min]
    #   bad_ranking[:gamma_gtp] = (self.gamma_gtp.to_f / Rails.configuration.x.reference_values[:gamma_gtp][:min]) * 100
    # end

    sorted_bad_rankings = bad_ranking.sort_by { |_key, value| -(value - 100).abs }.to_h

    recommendations = []

    conditions = sorted_bad_rankings.map do |key, value|
      up_or_down = value > 100 ? 'uptodown' : 'downtoup'
      [key, up_or_down]
    end

    tags_with_supplements = Tag.includes(:supplements).where(name: conditions.map(&:first),
                                                             up_or_down: conditions.map(&:second))

    recommendations = tags_with_supplements.flat_map(&:supplements)

    if body_type == 'やせ型'
      weight_tag = Tag.find_by(name: 'weight', up_or_down: 1)
    elsif body_type == '肥満(軽)' || body_type == '肥満(重)'
      weight_tag = Tag.find_by(name: 'weight', up_or_down: 0)
    end

    recommendations += weight_tag.supplements if weight_tag

    recommendations.flatten!
    recommendations.uniq!
    Supplement.where(id: recommendations.map(&:id))
  end
end
