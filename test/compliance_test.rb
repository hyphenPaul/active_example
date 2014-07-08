require 'test_helper'
require 'fixtures/non_compliant.rb'

class ComplianceTest < ActiveSupport::TestCase
  include ActiveModel::Lint::Tests

  def setup
    @model = NonCompliant.new
  end

  test 'the class knows it\'s name' do
    assert_equal 'non_compliant', @model.class.model_name.singular
    assert_equal 'Non compliant', @model.class.model_name.human
  end

  test 'the class is worldly' do
    begin
      I18n.backend.store_translations :en,
        activemodel: { models: { non_compliant: 'I will not comply!!'} }
      assert_equal 'I will not comply!!', @model.class.model_name.human
    ensure
      I18n.reload!
    end
  end
end
