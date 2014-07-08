class NonCompliant
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  extend ActiveModel::Translation
  include ActiveModel::Validations

  def persisted?
    false
  end
end
