class Insecure
  include ActiveExample::HandyAttributes
  include ActiveModel::Validations
  include ActiveExample::Validators
  extend ActiveExample::Validators::HelperMethods

  attributes :description
  validates_awesomeness_of :description
end
