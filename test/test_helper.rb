ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  
  def get_validation_min(model_name, attribute)
    (model_name.validators_on(attribute).select { |v| v.class == ActiveModel::Validations::LengthValidator }).first.options[:minimum]
  end
  
  def get_validation_max(model_name, attribute)
    (model_name.validators_on(attribute).select { |v| v.class == ActiveModel::Validations::LengthValidator }).first.options[:maximum]
  end
end
