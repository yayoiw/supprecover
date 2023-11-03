class PrecisionValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.nil? || value.round(1) == value
      record.errors.add(attribute, 'は半角数字かつ小数点第1位までとしてください')
    end
  end
end