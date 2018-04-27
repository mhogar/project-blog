require 'test_helper'

class LanguageTest < ActiveSupport::TestCase
  
  def setup
    @lang = Language.new(name: "Rails", language_icon_id: 1)
  end
  
  test "language is valid" do
    assert @lang.valid?
  end
  
  test "name is present" do
    @lang.name = nil
    assert_not @lang.valid?
  end
  
  test "name is not too long" do
    @lang.name = "a" * (get_validation_max(Language, :name) + 1)
    assert_not @lang.valid?
  end
  
  test "language_icon_id must be present" do
    @lang.language_icon_id = nil
    assert_not @lang.valid?
  end
end
